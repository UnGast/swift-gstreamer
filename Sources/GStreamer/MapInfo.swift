import CGStreamer

public class MapInfo {
  private var internalData: GstMapInfo
  private let buffer: Buffer

  public var data: UnsafeMutableBufferPointer<UInt8>? {
    if let rawPointer = internalData.data {
      return UnsafeMutableRawBufferPointer(start: rawPointer, count: Int(internalData.maxsize)).bindMemory(to: UInt8.self)
    }
    return nil
  }

  public init(_ internalData: GstMapInfo, for buffer: Buffer) {
    self.internalData = internalData
    self.buffer = buffer
  }

  deinit {
    gst_buffer_unmap(buffer.internalReference, &internalData)
  }
}