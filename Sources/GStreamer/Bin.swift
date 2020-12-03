import CGStreamer
import CGStreamerHelpers

public class Bin: Element {
  private var children = [Element]()

  public convenience init(name: String? = nil) {
    self.init(internalElement: gst_bin_new(name))
  }

  public convenience init(parse binDescription: String) throws {
    var error = Optional(UnsafeMutablePointer<GError>.allocate(capacity: 1))
    let internalElement = gst_parse_bin_from_description(binDescription, Int32(1), nil)//&error)

    if let error = error {
      print("ERORR", error.pointee)
      // this is a dirty fix...
      if error.pointee.domain < 1000000 {
        throw GStreamer.Error(internalReference: error)
      }
    }

    if let internalElement = internalElement {
      self.init(internalElement: internalElement)
    } else {
      throw ParsingError()
    }    
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

  public func getElementBy<T: Element>(name: String, type: T.Type) -> T? {
    if let reference = gst_bin_get_by_name(bin_cast(internalElement), name) {
      return T(internalElement: reference)
    }
    return nil
  }

  public struct ParsingError: Swift.Error {
    public let message = "an error occurred while parsing textual definition of bin"
  }
}