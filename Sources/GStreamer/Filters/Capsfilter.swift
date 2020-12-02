import CGStreamer

public class Capsfilter: Element {
  public convenience init(name: String? = nil) {
    self.init(internalElement: gst_element_factory_make("capsfilter", name))
  }

  public func setCaps(_ caps: Caps) {
    setProperty("caps", OpaquePointer(caps.internalReference))
  }
}