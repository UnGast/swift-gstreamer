import CGStreamer

public class Rtph264depay: Element {
  public convenience init(name: String? = nil) {
    self.init(internalElement: gst_element_factory_make("rtph264depay", name))
  }
}