@testable import EventListing
import XCTest

class IntExtensionsTests: XCTestCase {
    func test_IntExtensions_formattedAsDate_shouldApplyTheDefinedDateFormatting() {
        XCTAssertEqual(1534784400000.formattedAsDate(), "20/08/2018 às 14:00")
    }
}
