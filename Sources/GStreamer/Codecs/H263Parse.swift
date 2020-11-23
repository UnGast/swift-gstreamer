import CGStreamer

public class H263Parse: Element {
  public init(name: String? = nil) {
    super.init(internalElement: gst_element_factory_make("h263parse", name))
  }
}