import CGStreamer
import CGStreamerHelpers

public class Pipeline: Bin {
  override public init(name: String? = nil) {
    super.init(internalElement: gst_pipeline_new(name))
  }

  override public init?(parse pipelineDescription: String) {
    if let internalElement = gst_parse_launch(pipelineDescription, nil) {
      super.init(internalElement: internalElement)
      return
    }
    return nil
  }

  deinit {
    print("PIPELINE DEINITILAIZED")
  }

  public func getBus() -> Bus {
    Bus(internalReference: gst_pipeline_get_bus(pipeline_cast(internalElement)))
  }
}