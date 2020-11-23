import CGStreamer

public class VideoTestSource: Element {
  public init(name: String? = nil) {
    super.init(internalElement: gst_element_factory_make("videotestsrc", name))
  }
}