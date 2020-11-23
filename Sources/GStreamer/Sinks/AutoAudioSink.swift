import CGStreamer

public class AutoAudioSink: Element {
  public init(name: String? = nil) {
    super.init(internalElement: gst_element_factory_make("autoaudiosink", name))
  }
}