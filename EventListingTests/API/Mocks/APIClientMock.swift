@testable import EventListing
import RxSwift

class APIClientMock: APIClientProtocol {
    var requestCallCount = 0
    var shouldFail = false
    var error: APIError?
    var getEventsResult: Result<[EventListing.Event], APIError>?

    func request() -> Observable<[EventListing.Event]> {
        requestCallCount += 1
        return Observable.create { observer in
            switch self.getEventsResult {
            case let .success(events):
                observer.onNext(events)
            case let .failure(error):
                observer.onError(error)
            case .none:
                observer.onError(APIError.network(description: "not found"))
            }
            return Disposables.create()
        }
    }
}
