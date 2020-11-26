import CGStreamer
import CGStreamerHelpers

public class Sample {
  private let internalReference: OpaquePointer

  public init(_ internalReference: OpaquePointer) {
    self.internalReference = internalReference
  }

  deinit {
    gst_sample_unref(internalReference)
  }

  public func getBuffer() -> Buffer {
    let buffer = gst_sample_get_buffer(internalReference)!
    return Buffer(buffer)
  }
}