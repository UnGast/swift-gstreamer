import CGStreamer
import CGStreamerHelpers

public class Element {
  internal var internalElement: UnsafeMutablePointer<GstElement>

  public init(internalElement: UnsafeMutablePointer<GstElement>) {
    self.internalElement = internalElement
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
      result = gst_element_set_state(internalElement, GST_STATE_PLAYING)
    case .ready:
      result = gst_element_set_state(internalElement, GST_STATE_PLAYING)
    case .paused:
      result = gst_element_set_state(internalElement, GST_STATE_PLAYING)
    case .playing:
      result = gst_element_set_state(internalElement, GST_STATE_PLAYING)
    }
    if result == GST_STATE_CHANGE_FAILURE {
      throw Error.StateChangeFailed
    }
  }

  public enum State {
    case null, ready, paused, playing
  }

  public enum Error: Swift.Error {
    case StateChangeFailed
  }
}