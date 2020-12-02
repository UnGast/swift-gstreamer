import CGStreamer

public class VideoConvert: Element {
  public convenience init(name: String? = nil) {
    self.init(internalElement: gst_element_factory_make("videoconvert", name))
  }
}