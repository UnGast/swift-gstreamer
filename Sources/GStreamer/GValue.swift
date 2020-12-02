import Foundation
import CGStreamerHelpers

public protocol GValueConvertible {
  init?(gvalue: GValue)
  
  func toGValue() -> GValue
}

extension String: GValueConvertible {
  public init?(gvalue: GValue) {
    var mutableGvalue = gvalue
    if let rawValue = g_value_get_string(&mutableGvalue) {
      self.init(cString: rawValue)
    } else {
      return nil
    }
  }

  public func toGValue() -> GValue {
    var cstr = self.data(using: String.Encoding.utf8)!
    cstr.append(0)
    var int8arr = cstr.map{ Int8(bitPattern: $0) }
    return new_gvalue_string(&int8arr[0])
  } 
}

extension Int32: GValueConvertible {
  public init?(gvalue: GValue) {
    var mutableGValue = gvalue
    let rawValue = g_value_get_int(&mutableGValue)
    self = rawValue
  }

  public func toGValue() -> GValue {
    new_gvalue_int(self)
  }
}

extension UInt32: GValueConvertible {
  public init?(gvalue: GValue) {
    var mutableGValue = gvalue
    let rawValue = g_value_get_uint(&mutableGValue)
    self = rawValue
  }
  
  public func toGValue() -> GValue {
    new_gvalue_uint32(self)
  }
}

extension Bool: GValueConvertible {
  public init?(gvalue: GValue) {
    var mutableGvalue = gvalue
    let rawValue = g_value_get_boolean(&mutableGvalue)
    if rawValue == 0 {
      self = false
    } else {
      self = true
    }
  }

  public func toGValue() -> GValue {
    new_gvalue_bool(self)
  }
}