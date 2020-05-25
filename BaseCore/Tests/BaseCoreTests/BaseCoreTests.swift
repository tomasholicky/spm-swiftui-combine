import XCTest
@testable import BaseCore

final class BaseCoreTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(BaseCore().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
