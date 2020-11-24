import CGStreamer

internal var initialized: Bool = false

public func initialize() {
  if initialized {
    return
  }
  gst_init(nil, nil)
  initialized = true
}