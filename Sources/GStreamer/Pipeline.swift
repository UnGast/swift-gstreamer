import CGStreamer
import CGStreamerHelpers

public class Pipeline: Bin {
  public convenience init(name: String? = nil) {
    self.init(internalElement: gst_pipeline_new(name))
  }

  public convenience init(parse pipelineDescription: String) throws {
    var error = Optional(UnsafeMutablePointer<GError>.allocate(capacity: 1))
    let internalElement = gst_parse_launch(pipelineDescription, nil)//&error)

    if let error = error {
      // this is a dirty fix...
      if error.pointee.domain < 1000000 {
        throw GStreamer.Error(internalReference: error)
      }
    }

    if let internalElement = internalElement {
      self.init(internalElement: internalElement)
    } else {
      throw ParsingError()
    }
  }

  deinit {
    print("PIPELINE DEINITILAIZED")
  }

  public func getBus() -> Bus {
    Bus(internalReference: gst_pipeline_get_bus(pipeline_cast(internalElement)))
  }
}