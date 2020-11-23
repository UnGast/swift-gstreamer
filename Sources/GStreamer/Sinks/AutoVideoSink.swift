import CGStreamer

public class AutoVideoSink: Element {
  public init(sync: Bool? = nil, name: String? = nil) {
    super.init(internalElement: gst_element_factory_make("autovideosink", name))
    if let sync = sync {
      setProperty("sync", sync)
    }
  }
}