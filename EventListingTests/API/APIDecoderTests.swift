@testable import EventListing
import XCTest

// swiftlint:disable force_try
class APIDecoderTests: XCTestCase {
    func test_APIDecoder_decode_withNilData_shouldCompleteWithFailure() {
        APIDecoder.decode(nil) { result in
            XCTAssertEqual(result, .failure(.decoding(description: String.Localizable.nullDataError)))
        }
    }

    func test_APIDecoder_decode_withInvalidPayload_shouldCompleteWithFailure() {
        let payload: [String: Any] = ["wrong_key": "some value"]
        let data = try! JSONSerialization.data(withJSONObject: payload)

        APIDecoder.decode(data) { result in
            XCTAssertEqual(result, .failure(.decoding(description: String.Localizable.decodingError)))
        }
    }

    func test_APIDecoder_decode_withValidPayloadForPlaces_shouldCompleteWithFailure() {
        let payload: [[String: Any]] = [
            ["wrong_key": "some_value"]
        ]
        let data = try! JSONSerialization.data(withJSONObject: payload)

        APIDecoder.decode(data) { result in
            XCTAssertEqual(result, .failure(.decoding(description: String.Localizable.decodingError)))
        }
    }

    func test_APIDecoder_decode_withValidPayload_shouldCompleteWithSuccess() {
        let date1 = 1
        let description1 = "description 1"
        let id1 = "id 1"
        let image1 = "image 1"
        let latitude1 = 1.0
        let longitude1 = 1.0
        let price1 = 1.0
        let title1 = "title 1"

        let date2 = 2
        let description2 = "description 2"
        let id2 = "id 2"
        let image2 = "image 2"
        let latitude2 = 2.0
        let longitude2 = 2.0
        let price2 = 2.0
        let title2 = "title 2"

        let events: [[String: Any]] = [
            ["date": date1, "description": description1, "id": id1, "image": image1,
             "latitude": latitude1, "longitude": longitude1, "price": price1, "title": title1],
            ["date": date2, "description": description2, "id": id2, "image": image2,
             "latitude": latitude2, "longitude": longitude2, "price": price2, "title": title2]
        ]
        let data = try! JSONSerialization.data(withJSONObject: events)

        APIDecoder.decode(data) { result in
            XCTAssertEqual(result, .success([
                EventFactory.makeEvent(date: date1, description: description1, id: id1, image: image1,
                                       latitude: latitude1, longitude: longitude1, price: price1, title: title1),
                EventFactory.makeEvent(date: date2, description: description2, id: id2, image: image2,
                                       latitude: latitude2, longitude: longitude2, price: price2, title: title2)
            ]))
        }
    }
}
