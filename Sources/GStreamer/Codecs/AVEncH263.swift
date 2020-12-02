import CGStreamer

public class AVEncH263: Element {
  public convenience init(name: String? = nil) {
    self.init(internalElement: gst_element_factory_make("avenc_h263", name))
  }
}