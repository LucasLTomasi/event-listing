@testable import EventListing
import XCTest

class EventsListViewControllerTest: XCTestCase {
    var coordinator: CoordinatorMock!
    var viewModel: EventsListViewModelMock!
    var sut: EventsListViewController!

    override func setUp() {
        coordinator = CoordinatorMock()
        viewModel = EventsListViewModelMock()
        sut = EventsListViewController(viewModel: viewModel, coordinator: coordinator)
    }

    override func tearDown() {
        coordinator = nil
        viewModel = nil
        sut = nil
    }

    func test_EventsListViewController_viewDidLoad_shouldConfigureApproriateAppearance() {
        sut.viewDidLoad()

        XCTAssert(sut?.view is EventsListView)
        XCTAssertEqual(sut?.title, String.Localizable.eventsListViewTitle)
    }
}
