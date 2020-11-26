import Foundation
import CGStreamerHelpers

public protocol GValueConvertible {
  func toGValue() -> GValue
}

extension String: GValueConvertible {
  public func toGValue() -> GValue {
    var cstr = self.data(using: String.Encoding.utf8)!
    cstr.append(0)
    var int8arr = cstr.map{ Int8(bitPattern: $0) }
    return new_gvalue_string(&int8arr[0])
  } 
}

extension Int32: GValueConvertible {
  public func toGValue() -> GValue {
    new_gvalue_int(self)
  }
}

extension UInt32: GValueConvertible {
  public func toGValue() -> GValue {
    new_gvalue_uint32(self)
  }
}

extension Bool: GValueConvertible {
  public func toGValue() -> GValue {
    new_gvalue_bool(self)
  }
}