import CGStreamer
import CGStreamerHelpers

public class Bin: Element {
  public func add(_ element: Element) {
    var selfBin = bin_cast(internalElement)
    gst_bin_add(selfBin, element.internalElement)
  }
}