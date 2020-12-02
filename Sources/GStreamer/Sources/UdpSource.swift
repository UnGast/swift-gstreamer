import CGStreamer

public class UdpSource: Element {
  public convenience init(address: String? = nil, port: Int, caps: Caps? = nil, name: String? = nil) {
    self.init(internalElement: gst_element_factory_make("udpsrc", name))
    if let address = address {
      self.address = address
    }
    self.port = port
    if let caps = caps {
      setCaps(caps)
    }
  }

  public var address: String {
    get {
      getProperty("address", String.self)!
    }

    set {
      setProperty("address", newValue)
    }
  }

  public var port: Int {
    get {
      Int(getProperty("port", Int32.self)!)
    }

    set {
      setProperty("port", Int32(newValue))
    }
  }

  public func setCaps(_ caps: Caps) {
    setProperty("caps", OpaquePointer(caps.internalReference))
  }
}