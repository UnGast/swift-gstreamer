import CGStreamer
import CGStreamerHelpers

public class Element {
  internal var internalElement: UnsafeMutablePointer<GstElement>

  public var name: String {
    get {
      String(cString: gst_object_get_name(object_cast(internalElement)))
    }
  }

  public init(internalElement: UnsafeMutablePointer<GstElement>) {
    self.internalElement = internalElement
  }

  deinit {
    gst_object_unref(internalElement)
  }

  public func getStaticPad(_ name: String) -> Pad? {
    if let internalPadRef = gst_element_get_static_pad(internalElement, name) {
      return Pad(internalReference: internalPadRef)
    } else {
      return nil
    }
  }

  public func link(to destination: Element) {
    gst_element_link(internalElement, destination.internalElement)
  }

  public func setState(_ newState: State) throws {
    let result: GstStateChangeReturn = gst_element_set_state(internalElement, newState.rawValue)
    if result == GST_STATE_CHANGE_FAILURE {
      throw Error.StateChangeFailed
    }
  }

  public func getState() throws -> State {
    var currentState = UnsafeMutablePointer<GstState>.allocate(capacity: 1)
    // TODO: what to do with pending state
    var pendingState = UnsafeMutablePointer<GstState>.allocate(capacity: 1)
    let stateChangeResult = gst_element_get_state(internalElement, currentState, pendingState, 0)
    if stateChangeResult == GST_STATE_CHANGE_FAILURE {
      throw Error.StateChangeFailed
    }
    return State(rawValue: currentState.pointee)!
  }

  public func setProperty(name: String, value: OpaquePointer) {
    set_gst_element_struct_field(internalElement, name, value)
  }

  public func setProperty(_ name: String, _ value: OpaquePointer) {
    setProperty(name: name, value: value)
  }

  public func setProperty<T: GValueConvertible>(name: String, value: T) {
    var gvalue = value.toGValue()
    g_object_set_property(gobject_cast(internalElement), name, &gvalue)
  }

  public func setProperty<T: GValueConvertible>(_ name: String, _ value: T) {
    setProperty(name: name, value: value)
  }

  public func getProperty<T: GValueConvertible>(name: String, type: T.Type) -> T? {
    var gvalue = new_gvalue()
    g_object_get_property(gobject_cast(internalElement), name, &gvalue)
    return T.init(gvalue: gvalue) 
  }

  public func getProperty<T: GValueConvertible>(_ name: String, _ type: T.Type) -> T? {
    getProperty(name: name, type: type)
  }

  public enum State: RawRepresentable {
    case voidPending
    case null
    case ready
    case paused
    case playing

    public init?(rawValue: GstState) {
      switch rawValue {
      case GST_STATE_VOID_PENDING:
        self = .voidPending
      case GST_STATE_NULL:
        self = .null
      case GST_STATE_READY:
        self = .ready
      case GST_STATE_PAUSED:
        self = .paused
      case GST_STATE_PLAYING:
        self = .playing
      default:
        return nil
      }
    }

    public var rawValue: GstState {
      switch self {
      case .voidPending:
        return GST_STATE_VOID_PENDING
      case .null:
        return GST_STATE_NULL
      case .ready:
        return GST_STATE_READY
      case .paused:
        return GST_STATE_PAUSED
      case .playing:
        return GST_STATE_PLAYING
      }
    }
  }

  public enum Error: Swift.Error {
    case StateChangeFailed
  }
}