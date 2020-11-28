import CGStreamer

public class VideoScale: Element {
  public init(name: String? = nil) {
    super.init(internalElement: gst_element_factory_make("videoscale", name))
  }
}