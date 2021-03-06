import Foundation

enum APIDecoder {
    static func decode(_ data: Data?, completion: @escaping (Result<[Event], APIError>) -> Void) {
        guard let data = data else {
            completion(.failure(.decoding(description: String.Localizable.nullDataError)))
            return
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let response = try decoder.decode([Event].self, from: data)
            completion(.success(response))
        } catch {
            completion(.failure(.decoding(description: String.Localizable.decodingError)))
        }
    }
}
