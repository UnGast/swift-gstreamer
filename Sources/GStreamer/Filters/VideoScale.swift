import CGStreamer

public class VideoScale: Element {
  public convenience init(name: String? = nil) {
    self.init(internalElement: gst_element_factory_make("videoscale", name))
  }
}