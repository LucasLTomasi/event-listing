@testable import EventListing
import RxSwift
import XCTest

class EventsListViewModelTests: XCTestCase {
    var apiClient: APIClientMock!
    var sut: EventsListViewModelProtocol!
    var disposeBag: DisposeBag!

    override func setUp() {
        apiClient = APIClientMock()
        sut = EventsListViewModel(apiClient: apiClient)
        disposeBag = DisposeBag()
    }

    override func tearDown() {
        apiClient = nil
        sut = nil
        disposeBag = nil
    }

    func test_EventsListViewModel_geEvents_withoutErrors_shouldReceiveSuccessWhenRequestIsCalledFromAPIClient() {
        apiClient.getEventsResult = .success([EventFactory.makeEvent()])

        let expectation = expectation(description: "Event cell created")
        sut.events.subscribe(
            onNext: { events in
                XCTAssertEqual(events.count, 1)
                XCTAssertEqual(events.first?.title, "event title")
                expectation.fulfill()
            }
        ).disposed(by: disposeBag)

        sut.getEvents()

        wait(for: [expectation], timeout: 0.1)
        XCTAssertEqual(apiClient.requestCallCount, 1)
    }

    func test_EventsListViewModel_geEvents_withDecodingError_shouldReceiveFailureWhenRequestIsCalledFromAPIClient() {
        apiClient.getEventsResult = .failure(APIError.decoding(description: ""))

        let expectation = expectation(description: "Event cell was not created")
        sut.events.subscribe(
            onNext: { _ in
                XCTFail("should call onError instead")
            }, onError: { _ in
                expectation.fulfill()
            }
        ).disposed(by: disposeBag)

        sut.getEvents()

        wait(for: [expectation], timeout: 0.1)
        XCTAssertEqual(apiClient.requestCallCount, 1)
    }

    func test_EventsListViewModel_geEvents_withNetworkingError_shouldReceiveFailureWhenRequestIsCalledFromAPIClient() {
        apiClient.getEventsResult = .failure(APIError.network(description: ""))

        let expectation = expectation(description: "Event cell was not created")
        sut.events.subscribe(
            onNext: { _ in
                XCTFail("should call onError instead")
            }, onError: { _ in
                expectation.fulfill()
            }
        ).disposed(by: disposeBag)

        sut.getEvents()

        wait(for: [expectation], timeout: 0.1)
        XCTAssertEqual(apiClient.requestCallCount, 1)
    }
}
