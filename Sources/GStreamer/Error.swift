import CGStreamer

public class Error: Swift.Error, CustomDebugStringConvertible {
  private let internalReference: UnsafeMutablePointer<GError>

  public init(internalReference: UnsafeMutablePointer<GError>) {
    self.internalReference = internalReference
  }

  public var localizedDescription: String {
    "\(message), \(gstMessage)"
  }

  public var debugDescription: String {
    localizedDescription
  }

  public var message: String {
    if let rawMessage = internalReference.pointee.message {
      return String(cString: rawMessage)
    } else {
      return ""
    }
  }

  public var gstMessage: String {
    if let rawMessage = gst_error_get_message(internalReference.pointee.domain, internalReference.pointee.code) {
      return String(cString: rawMessage)
    }
    return ""
  }

  deinit {
    g_error_free(internalReference)
  }
}