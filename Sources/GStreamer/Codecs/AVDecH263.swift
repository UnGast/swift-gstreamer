import CGStreamer

public class AVDecH263: Element {
  public init(name: String? = nil) {
    super.init(internalElement: gst_element_factory_make("avdec_h263", name))
  }
}