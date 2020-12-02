import CGStreamerHelpers

public struct Fraction: GValueConvertible {
  public var numerator: Int
  public var denominator: Int
  
  public init(numerator: Int, denominator: Int) {
    self.numerator = numerator
    self.denominator = denominator
  }

  public init(gvalue: GValue) {
    var mutableGValue = gvalue
    let numerator = gst_value_get_fraction_numerator(&mutableGValue)
    let denominator = gst_value_get_fraction_denominator(&mutableGValue)
    self.init(numerator: Int(numerator), denominator: Int(denominator))
  }

  public func toGValue() -> GValue {
    new_gvalue_fraction(Int32(numerator), Int32(denominator))
  }
}