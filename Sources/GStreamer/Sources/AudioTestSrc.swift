import CGStreamer

public class AudioTestSrc: Element {
  public init() {
    super.init(internalElement: gst_element_factory_make("audiotestsrc", "audio-source"))
  }
}