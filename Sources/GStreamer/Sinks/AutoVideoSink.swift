import CGStreamer

public class AutoVideoSink: Element {
  public init(name: String? = nil) {
    super.init(internalElement: gst_element_factory_make("autovideosink", name))
  }
}