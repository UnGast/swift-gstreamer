import CGStreamer
import CGStreamerHelpers

public class AppSink: Element {
  public init(name: String? = nil) {
    super.init(internalElement: gst_element_factory_make("appsink", name))
  }
 
  public func pullSample() -> Sample {
    let sample = get_gst_sample(internalElement)!
    return Sample(sample)
  }
}