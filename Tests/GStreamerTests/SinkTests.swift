import XCTest
@testable import GStreamer

final class SinkTests: XCTestCase {
  func testTcpServerSink() {
    let sink = TcpServerSink()
    print("SINK", sink)
  }
}

