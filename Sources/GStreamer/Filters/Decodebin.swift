import CGStreamer

public class Decodebin: Element {
  public convenience init(name: String? = nil) {
    self.init(internalElement: gst_element_factory_make("decodebin", name))
  }
}