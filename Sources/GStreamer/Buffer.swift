import CGStreamer

public class Buffer {
  internal let internalReference: UnsafeMutablePointer<GstBuffer>

  private var parent: AnyObject?
  
  public init(_ internalReference: UnsafeMutablePointer<GstBuffer>, parent: AnyObject? = nil) {
    self.internalReference = internalReference
    self.parent = parent
  }

  public func unref() {
    gst_buffer_unref(internalReference)
    print("BUFFER DEINIT")
  }

  public func ref() {
    gst_buffer_ref(internalReference)
  }

  public func getMap() -> MapInfo {
    var mapInfo = GstMapInfo()
    gst_buffer_map(internalReference, &mapInfo, GST_MAP_READ)
    return MapInfo(mapInfo, parent: self)
  }
}