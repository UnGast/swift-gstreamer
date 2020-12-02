import CGStreamer
import CGStreamerHelpers

public class Sample {
  private let internalReference: OpaquePointer

  public init(_ internalReference: OpaquePointer) {
    self.internalReference = internalReference
  }

  public func unref() {
    gst_sample_unref(internalReference)
    print("SAMPLE DEINIT")
  }

  public func getBuffer() -> Buffer? {
    if let buffer = gst_sample_get_buffer(internalReference) {
      return Buffer(buffer, parent: self)
    } else {
      return nil
    }
  }
}