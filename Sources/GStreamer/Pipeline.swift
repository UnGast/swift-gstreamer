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
      if error.pointee.code > 0 && error.pointee.code < 127 {
        throw GStreamer.Error(internalReference: error)
      } else {
        print("dropped error because of 0 < code < 127", error.pointee)
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