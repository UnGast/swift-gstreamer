import CGStreamer

public class Buffer {
  private let internalData: UnsafeMutablePointer<GstBuffer>
  
  public init(internalData: UnsafeMutablePointer<GstBuffer>) {
    self.internalData = internalData
  }

  public func map() -> GstMapInfo {
    var mapInfo = GstMapInfo()
    gst_buffer_map(internalData, &mapInfo, GST_MAP_READ)
    return mapInfo
  }
}