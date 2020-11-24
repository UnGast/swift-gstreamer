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

  public init(mediaType: String, format: String, width: Int, height: Int) {
    internalReference = gst_caps_new_empty_simple(mediaType)
    setValue("format", format)
    //setValue("framerate", Fraction(numerator: 30, denominator: 1))
    //setValue("pixel-aspect-ratio", Fraction(numerator: 1, denominator: 1))
    setValue("width", Int32(width))
    setValue("height", Int32(height))
  }

  private func setValue<T: GValueConvertible>(_ field: String, _ value: T) {
    var gvalue = value.toGValue()
    gst_caps_set_value(internalReference, field, &gvalue)
  }

  public func fixate() -> Caps {
    return Caps(internalReference: gst_caps_fixate(internalReference))
  }

  deinit {
    gst_caps_unref(internalReference)
  }
}