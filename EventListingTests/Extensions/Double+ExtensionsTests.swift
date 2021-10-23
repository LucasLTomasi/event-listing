@testable import EventListing
import XCTest

class DoubleExtensionsTests: XCTestCase {
    func test_DoubleExtensions_formattedAsPrice_shouldAddTheMoneySignAndReplaceTheDecimalSign() {
        XCTAssertEqual(1.0.formattedAsPrice(), "R$ 1,00")
        XCTAssertEqual(1.00.formattedAsPrice(), "R$ 1,00")
        XCTAssertEqual(1.000.formattedAsPrice(), "R$ 1,00")
    }
}
