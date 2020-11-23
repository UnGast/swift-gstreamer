import CGStreamer
import CGStreamerHelpers

public class Pipeline: Bin {
  public init() {
    super.init(internalElement: gst_pipeline_new("pipeline"))
  }
}