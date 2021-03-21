import XCTest
@testable import DefinedElements

final class DefinedElementsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(DefinedElements().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
