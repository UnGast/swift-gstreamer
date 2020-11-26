import CGStreamer

public class Buffer {
  internal let internalReference: UnsafeMutablePointer<GstBuffer>
  
  public init(_ internalReference: UnsafeMutablePointer<GstBuffer>) {
    self.internalReference = internalReference
  }

  deinit {
    gst_buffer_unref(internalReference)
  }

  public func getMap() -> MapInfo {
    var mapInfo = GstMapInfo()
    gst_buffer_map(internalReference, &mapInfo, GST_MAP_READ)
    return MapInfo(mapInfo, for: self)
  }
}