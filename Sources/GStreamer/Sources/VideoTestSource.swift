import CGStreamer
import CGStreamerHelpers

public class VideoTestSource: Element {
  public init(name: String? = nil) {
    super.init(internalElement: gst_element_factory_make("videotestsrc", name))
  }

  public func setPattern(_ pattern: Pattern) {
    setProperty("pattern", pattern.rawValue)
  }

  public enum Pattern: Int32 {
    case smpte 
    case snow
    case black
    case white
    case red
    case green
    case blue
    case checkers1
    case checkers2
    case checkers4
    case checkers8
    case circular
    case blink
    case smpte75
    case zonePlate
    case gamut
    case chromaZonePlate
    case solidColor
    case ball
    case smpte100
    case bar
    case pinwheel
    case spokes
    case gradient
    case colors
  }
}