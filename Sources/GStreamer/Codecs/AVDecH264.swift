import CGStreamer

public class AVDecH264: Element {
  public convenience init(name: String? = nil) {
    self.init(internalElement: gst_element_factory_make("avdec_h264", name))
  }
}