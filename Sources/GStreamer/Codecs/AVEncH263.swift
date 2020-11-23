import CGStreamer

public class AVEncH263: Element {
  public init(name: String? = nil) {
    super.init(internalElement: gst_element_factory_make("avenc_h263", name))
  }
}