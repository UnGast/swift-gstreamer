import CGStreamer
import CGStreamerHelpers

public class AppSink: Element {
  public init(name: String? = nil) {
    super.init(internalElement: gst_element_factory_make("appsink", name))
  }

  public func setMaxBuffers(_ max: UInt) {
    setProperty("max-buffers", UInt32(max))
  }
 
  public func setDrop(_ drop: Bool) {
    setProperty("drop", drop)
  }

  public func pullSample() -> Sample? {
    if let sample = get_gst_app_sink_sample(internalElement) {
      return Sample(sample)
    }
    return nil
  }

  public func tryPullSample(timeout: Double) -> Sample? {
    if let sample = get_gst_app_sink_sample_timeout(internalElement, timeout) {
      return Sample(sample)
    }
    return nil
  }
}