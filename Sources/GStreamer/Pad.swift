import CGStreamer

public class Pad {
  private let internalReference: UnsafeMutablePointer<GstPad>
  
  public init(internalReference: UnsafeMutablePointer<GstPad>) {
    self.internalReference = internalReference  
  }

  public func setCaps(_ caps: Caps) {
    gst_pad_set_caps(internalReference, caps.internalReference)
  }

  public func useFixedCaps() {
    gst_pad_use_fixed_caps(internalReference)
  }
}