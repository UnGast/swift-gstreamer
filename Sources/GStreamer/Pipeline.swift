import CGStreamer
import CGStreamerHelpers

public class Pipeline: Bin {
  public convenience init(name: String? = nil) {
    self.init(internalElement: gst_pipeline_new(name))
  }

  public convenience init?(parse pipelineDescription: String) {
    if let internalElement = gst_parse_launch(pipelineDescription, nil) {
      self.init(internalElement: internalElement)
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