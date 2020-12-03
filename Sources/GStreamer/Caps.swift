import CGStreamer
import CGStreamerHelpers

public class Caps: CustomDebugStringConvertible {
  internal let internalReference: UnsafeMutablePointer<GstCaps>

  public var debugDescription: String {
    "\(internalReference.pointee)"
  }

  internal init(internalReference: UnsafeMutablePointer<GstCaps>) {
    self.internalReference = internalReference
  }

  public init(mediaType: String) {
    internalReference = gst_caps_new_empty_simple(mediaType)
  }

  public convenience init(mediaType: String, format: String, width: Int, height: Int) {
    self.init(mediaType: mediaType)
    setValue("format", format)
    //setValue("framerate", Fraction(numerator: 30, denominator: 1))
    //setValue("pixel-aspect-ratio", Fraction(numerator: 1, denominator: 1))
    setValue("width", Int32(width))
    setValue("height", Int32(height))
  }

  public func setValue<T: GValueConvertible>(_ field: String, _ value: T) {
    var gvalue = value.toGValue()
    gst_caps_set_value(internalReference, field, &gvalue)
  }

  public func fixate() -> Caps {
    return Caps(internalReference: gst_caps_fixate(internalReference))
  }

  public var isFixed: Bool {
    gst_caps_is_fixed(internalReference) != 0
  }

  public func getStructure(_ index: UInt) -> Structure? {
    let structureReference = gst_caps_get_structure(internalReference, UInt32(index))
    if let structureReference = structureReference {
      return Structure(internalReference: structureReference)
    }
    return nil
  }

  deinit {
    gst_caps_unref(internalReference)
  }
}