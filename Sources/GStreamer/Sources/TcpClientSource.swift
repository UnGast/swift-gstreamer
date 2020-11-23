import CGStreamer

public class TcpClientSource: Element {
  public init(host: String, port: Int, name: String? = nil) {
    super.init(internalElement: gst_element_factory_make("tcpclientsrc", name))
    setProperty("host", host)
    setProperty("port", Int32(port))
  }
}