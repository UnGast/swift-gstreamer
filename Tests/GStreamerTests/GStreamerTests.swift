import XCTest
@testable import GStreamer

final class GStreamerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(GStreamer().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
