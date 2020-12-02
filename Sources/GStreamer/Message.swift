import CGStreamer
import CGStreamerHelpers

public class Message {
  private let internalReference: UnsafeMutablePointer<GstMessage>
  
  public init(internalReference: UnsafeMutablePointer<GstMessage>) {
    self.internalReference = internalReference
  }

  deinit {
    gst_message_unref(internalReference)
  }

  public var type: MessageType {
    MessageType(rawValue: get_gst_message_type(internalReference))!
  }

  public var data: MessageData? {
    switch type {
    case .stateChanged:
      var oldState = UnsafeMutablePointer<GstState>.allocate(capacity: 1)
      var newState = UnsafeMutablePointer<GstState>.allocate(capacity: 1)
      gst_message_parse_state_changed(internalReference, oldState, newState, nil)
      return .stateChanged(oldState: Element.State(rawValue: oldState.pointee)!, newState: Element.State(rawValue: newState.pointee)!)
    case .error:
      var errorValuePointer = Optional(UnsafeMutablePointer<GError>.allocate(capacity: 1))
      gst_message_parse_error(internalReference, &errorValuePointer, nil)
      if let errorValuePointer = errorValuePointer {
        return .error(GStreamer.Error(internalReference: errorValuePointer))
      }
      return nil
    default:
      return nil
    }
  }

  public enum MessageType: Int32 {
    case unknown = 0
    case eos = 1
    case error = 2
    case warning = 4
    case info = 8
    case tag = 16
    case buffering = 32
    case stateChanged = 64
    case stateDirty = 128
    case stepDone = 256
    case clockProvide = 512
    case clockLost = 1024
    case newClock = 2048
    case structureChange = 4096
    case streamStatus = 8192
    case application = 16384
    case element = 32768
    case segmentStart = 65536
    case segmentDone = 131072
    case durationChanged = 262144
    case latency = 524288
    case asyncStart = 1048576
    case asyncDone = 2097152
    case requestState = 4194304
    case stepStart = 8388608
    case qos = 16777216
    case progress = 33554432
    case toc = 67108864
    case resetTime = 134217728
    case streamStart = 268435456
    case needContext = 536870912
    case haveContext = 1073741824
    /*case extended = 2147483648
    case deviceAdded = 2147483649
    case deviceRemoved = 2147483650
    case propertyNotify = 2147483651
    case streamCollection = 2147483652
    case streamsSelected = 2147483653
    case redirect = 2147483654
    case deviceChanged = 2147483655
    case instantRateRequest = 2147483656
    case any = 4294967295*/
  }

  public enum MessageData {
    case stateChanged(oldState: Element.State, newState: Element.State)
    case error(_ error: GStreamer.Error)
  }
}