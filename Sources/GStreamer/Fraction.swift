import CGStreamerHelpers

public struct Fraction: GValueConvertible {
  public var numerator: Int
  public var denominator: Int
  
  public init(numerator: Int, denominator: Int) {
    self.numerator = numerator
    self.denominator = denominator
  }

  public func toGValue() -> GValue {
    new_gvalue_fraction(Int32(numerator), Int32(denominator))
  }
}