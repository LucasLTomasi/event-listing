import Foundation
import RxSwift

class APIClient: APIClientProtocol {
    static let shared = APIClient()
    private let session = URLSession.shared

    private init() {}

    private enum EventsMockAPI {
        static let scheme = "http"
        static let host = "5f5a8f24d44d640016169133.mockapi.io"
        static let path = "/api/events"
    }

    private func makeURLComponents() -> URLComponents {
        var components = URLComponents()
        components.scheme = EventsMockAPI.scheme
        components.host = EventsMockAPI.host
        components.path = EventsMockAPI.path
        return components
    }

    func request() -> Observable<[Event]> {
        let components = makeURLComponents()
        guard let url = components.url else {
            return Observable.error(APIError.network(description: String.Localizable.urlCreationError))
        }
        return Observable.create { observer -> Disposable in
            let task = self.session.dataTask(with: url) { data, _, _ in
                APIDecoder.decode(data) { result in
                    switch result {
                    case .success(let events):
                        observer.onNext(events)
                    case .failure(let error):
                        observer.onError(error)
                    }
                }
            }
            task.resume()
            return Disposables.create(with: task.cancel)
        }
    }
}
