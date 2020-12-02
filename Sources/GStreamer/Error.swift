import CGStreamer

public class Error {
  private let internalReference: UnsafeMutablePointer<GError>

  public init(internalReference: UnsafeMutablePointer<GError>) {
    self.internalReference = internalReference
  }

  public var message: String {
    String(cString: internalReference.pointee.message)
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