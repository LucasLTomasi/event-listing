@testable import EventListing
import XCTest

class EventDetailViewControllerTest: XCTestCase {
    var sut: EventDetailViewController!

    func test_EventDetailViewController_viewDidLoad_shouldConfigureApproriateAppearance() {
        let event = EventFactory.makeEvent()

        sut = EventDetailViewController(viewModel: EventViewModel(event: event))
        sut.viewDidLoad()

        XCTAssert(sut?.view is EventDetailView)
        XCTAssertEqual(sut?.title, String.Localizable.eventDetailViewTitle)
    }
}
