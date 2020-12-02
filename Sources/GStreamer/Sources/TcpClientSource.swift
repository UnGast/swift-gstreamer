import CGStreamer

public class TcpClientSource: Element {
  public convenience init(host: String, port: Int, name: String? = nil) {
    self.init(internalElement: gst_element_factory_make("tcpclientsrc", name))
    setProperty("host", host)
    setProperty("port", Int32(port))
  }
}