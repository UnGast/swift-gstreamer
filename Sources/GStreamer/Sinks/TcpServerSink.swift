import CGStreamer
import CGStreamerHelpers
import CGLib

public class TcpServerSink: Element {
  public convenience init(host: String, port: Int, name: String? = nil) {
    self.init(internalElement: gst_element_factory_make("tcpserversink", name))
    setProperty("host", host)
    setProperty("port", Int32(port))
  }
}