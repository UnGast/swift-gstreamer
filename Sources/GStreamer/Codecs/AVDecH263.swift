import CGStreamer

public class AVDecH263: Element {
  public convenience init(name: String? = nil) {
    self.init(internalElement: gst_element_factory_make("avdec_h263", name))
  }
}