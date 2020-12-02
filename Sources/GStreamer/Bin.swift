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

  public init?(parse binDescription: String) {
    var error = Optional(UnsafeMutablePointer<GError>.allocate(capacity: 1))
    if let internalElement = gst_parse_bin_from_description(binDescription, Int32(0), nil) {
      print("PARSE", internalElement)
      /*if let error = error {
        return nil
      }*/
      super.init(internalElement: internalElement)
      return
    }
    return nil
  }

  public func add(_ element: Element) {
    let selfBin = bin_cast(internalElement)
    gst_bin_add(selfBin, element.internalElement)
    children.append(element)
  }

  public func add(_ elements: Element...) {
    for element in elements {
      add(element)
    }
  }
}