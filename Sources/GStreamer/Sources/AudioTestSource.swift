import CGStreamer

public class AudioTestSource: Element {
  public init(name: String? = nil) {
    super.init(internalElement: gst_element_factory_make("audiotestsrc", name))
  }
}