import Foundation

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

    func request() {}
}
