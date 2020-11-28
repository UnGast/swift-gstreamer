import CGStreamer
import CGStreamerHelpers

public class Bin: Element {
  private var children = [Element]()

  public init(name: String? = nil) {
    super.init(internalElement: gst_bin_new(name))
  }

  override internal init(internalElement: UnsafeMutablePointer<GstElement>) {
    super.init(internalElement: internalElement)
  }

  public func add(_ element: Element) {
    let selfBin = bin_cast(internalElement)
    gst_bin_add(selfBin, element.internalElement)
    children.append(element)
  }
}