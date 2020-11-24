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

  public func play() throws {
    //state = .playing
    try setState(.playing)
  }

  public func setState(_ newState: State) throws {
    let result: GstStateChangeReturn
    switch newState {
    case .null:
      result = gst_element_set_state(internalElement, GST_STATE_NULL)
    case .ready:
      result = gst_element_set_state(internalElement, GST_STATE_READY)
    case .paused:
      result = gst_element_set_state(internalElement, GST_STATE_PAUSED)
    case .playing:
      result = gst_element_set_state(internalElement, GST_STATE_PLAYING)
    }
    if result == GST_STATE_CHANGE_FAILURE {
      throw Error.StateChangeFailed
    }
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

  public enum State {
    case null, ready, paused, playing
  }

  public enum Error: Swift.Error {
    case StateChangeFailed
  }
}