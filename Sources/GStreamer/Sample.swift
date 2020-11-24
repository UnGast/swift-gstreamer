import CGStreamer
import CGStreamerHelpers

public class Sample {
  private let internalData: OpaquePointer

  public init(_ internalData: OpaquePointer) {
    self.internalData = internalData
  }

  deinit {
    gst_sample_unref(internalData)
  }

  public func getBuffer() -> Buffer {
    let buffer = gst_sample_get_buffer(internalData)!
    return Buffer(internalData: buffer)
  }
}