import XCTest
@testable import DictionaryBuilder

final class DictionaryBuilderTests: XCTestCase {
    func testExample() {
        do {
            let dictionary: [String: Int] = .init {
                [
                    "a": 2,
                    "b": 3,
                ]
            }
            XCTAssertEqual(dictionary, [
                "a": 2,
                "b": 3,
            ])
        }
        
        do {
            let dictionary: [String: Int] =  .init {
                [
                    "a": 2,
                    "b": 3,
                ]
                [
                    "c": 5,
                    "d": 7,
                    "e": 11,
                ]
            }
            XCTAssertEqual(dictionary, [
                "a": 2,
                "b": 3,
                "c": 5,
                "d": 7,
                "e": 11,
            ])
        }
        
        do {
            let isFoo = true
            let dictionary: [String: Int] =  .init {
                [
                    "a": 2,
                    "b": 3,
                ]
                if isFoo { ["c": 5] }
            }
            XCTAssertEqual(dictionary, [
                "a": 2,
                "b": 3,
                "c": 5,
            ])
        }

        do {
            let isFoo = false
            let dictionary: [String: Int] =  .init {
                [
                    "a": 2,
                    "b": 3,
                ]
                if isFoo { ["c": 5] }
            }
            XCTAssertEqual(dictionary, [
                "a": 2,
                "b": 3,
            ])
        }
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
