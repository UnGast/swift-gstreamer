import XCTest

import GStreamerTests

var tests = [XCTestCaseEntry]()
tests += GStreamerTests.allTests()
XCTMain(tests)
