import CGStreamer

public class MapInfo {
  private var internalData: GstMapInfo
  private let parent: Buffer

  public var data: UnsafeBufferPointer<UInt8>? {
    if let rawPointer = internalData.data, internalData.flags.rawValue & Flags.read.rawValue == Flags.read.rawValue {
      return UnsafeRawBufferPointer(start: rawPointer, count: Int(internalData.size)).bindMemory(to: UInt8.self)
    }
    return nil
  }

  public var mutableData: UnsafeMutableBufferPointer<UInt8>? {
    if let rawPointer = internalData.data, internalData.flags.rawValue & Flags.write.rawValue == Flags.write.rawValue {
      return UnsafeMutableRawBufferPointer(start: rawPointer, count: Int(internalData.size)).bindMemory(to: UInt8.self)
    }
    return nil
  }

  public init(_ internalData: GstMapInfo, parent: Buffer) {
    self.internalData = internalData
    self.parent = parent
  }

  public func unref() {
    gst_buffer_unmap(parent.internalReference, &internalData)
    print("MAP UNREF")
  }
}

extension MapInfo {
  public enum Flags: UInt32 {
    case read = 1
    case write = 2
    case lastFlag = 65536
  }
}