import CGStreamer

public class Structure {
  private let internalReference: UnsafeMutablePointer<GstStructure>

  public init(internalReference: UnsafeMutablePointer<GstStructure>) {
    self.internalReference = internalReference
  }

  public func get<T>(name: String, type: T.Type) -> T? {
    switch type {
    case is Int32.Type:
      var valuePointer = UnsafeMutablePointer<Int32>.allocate(capacity: 1)
      if gst_structure_get_int(internalReference, name, valuePointer) != 0 {
        return valuePointer.pointee as! T
      }
      return nil
    default:
      print("get() not implemented for type: \(type)")
      return nil
    }
  }

  public func get<T>(_ name: String, _ type: T.Type) -> T? {
    get(name: name, type: type)
  }
}