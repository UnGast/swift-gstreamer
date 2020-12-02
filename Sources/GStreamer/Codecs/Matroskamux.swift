import CGStreamer

public class Matroskamux: Element {
  public convenience init(name: String? = nil) {
    self.init(internalElement: gst_element_factory_make("matroskamux", name))
  }
}