import CGStreamer

public class AutoAudioSink: Element {
  public convenience init(name: String? = nil) {
    self.init(internalElement: gst_element_factory_make("autoaudiosink", name))
  }
}