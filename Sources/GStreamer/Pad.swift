import CGStreamer

public class Pad {
  private let internalReference: UnsafeMutablePointer<GstPad>
  
  public init(internalReference: UnsafeMutablePointer<GstPad>) {
    self.internalReference = internalReference  
  }

  public var caps: Caps {
    get {
      let capsReference = gst_pad_get_current_caps(internalReference)!
      return Caps(internalReference: capsReference)
    }
    
    set {
      gst_pad_set_caps(internalReference, caps.internalReference)
    }
  }

  public func useFixedCaps() {
    gst_pad_use_fixed_caps(internalReference)
  }
}