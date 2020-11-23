import CGStreamer

public class AutoAudioSink: Element {
  public init() {
    super.init(internalElement: gst_element_factory_make("autoaudiosink", "audio-output"))
  }
}