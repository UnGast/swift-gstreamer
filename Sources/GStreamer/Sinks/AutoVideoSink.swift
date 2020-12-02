import CGStreamer

public class AutoVideoSink: Element {
  public convenience init(sync: Bool? = nil, name: String? = nil) {
    self.init(internalElement: gst_element_factory_make("autovideosink", name))
    if let sync = sync {
      setProperty("sync", sync)
    }
  }
}