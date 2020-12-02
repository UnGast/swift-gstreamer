import CGStreamer

public class AudioTestSource: Element {
  public convenience init(name: String? = nil) {
    self.init(internalElement: gst_element_factory_make("audiotestsrc", name))
  }
}