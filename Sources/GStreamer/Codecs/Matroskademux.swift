import CGStreamer

public class Matroskademux: Element {
  public convenience init(name: String? = nil) {
    self.init(internalElement: gst_element_factory_make("matroskademux", name))
  }
}