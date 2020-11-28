import CGStreamer

public class Bus {
  private let internalReference: UnsafeMutablePointer<GstBus>

  public init(internalReference: UnsafeMutablePointer<GstBus>) {
    self.internalReference = internalReference
  }

  deinit {
    gst_object_unref(internalReference)
  }

  public func peek() -> Message? {
    if let internalReference = gst_bus_peek(internalReference) {
      return Message(internalReference: internalReference)
    }
    return nil
  }

  public func pop() -> Message? {
    if let internalReference = gst_bus_pop(internalReference) {
      return Message(internalReference: internalReference)
    }
    return nil
  }

  public func popAll() -> [Message] {
    var messages = [Message]()
    while let message = pop() {
      messages.append(message)
    }
    return messages
  }
}