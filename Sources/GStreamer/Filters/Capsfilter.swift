import CGStreamer

public class Capsfilter: Element {
  public init(name: String? = nil) {
    super.init(internalElement: gst_element_factory_make("capsfilter", name))
  }

  public func setCaps(_ caps: Caps) {
    setProperty("caps", OpaquePointer(caps.internalReference))
  }
}