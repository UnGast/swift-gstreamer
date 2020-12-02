import CGStreamer

public class H263Parse: Element {
  public convenience init(name: String? = nil) {
    self.init(internalElement: gst_element_factory_make("h263parse", name))
  }
}