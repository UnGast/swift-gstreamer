import CGStreamer

public class VideoConvert: Element {
  public init(name: String? = nil) {
    super.init(internalElement: gst_element_factory_make("videoconvert", name))
  }
}