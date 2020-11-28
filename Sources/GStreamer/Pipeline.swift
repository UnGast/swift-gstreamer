import CGStreamer
import CGStreamerHelpers

public class Pipeline: Bin {
  override public init(name: String? = nil) {
    super.init(internalElement: gst_pipeline_new(name))
  }

  public func getBus() -> Bus {
    Bus(internalReference: gst_pipeline_get_bus(pipeline_cast(internalElement)))
  }
}