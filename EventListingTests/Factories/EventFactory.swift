@testable import EventListing

enum EventFactory {
    static func makeEvent(date: Int = 12345,
                          description: String = "event description",
                          id: String = "event id",
                          image: String = "event image",
                          latitude: Double = 12.34,
                          longitude: Double = 56.78,
                          price: Double = 9.99,
                          title: String = "event title") -> Event {
        Event(date: date,
              description: description,
              id: id,
              image: image,
              latitude: latitude,
              longitude: longitude,
              price: price,
              title: title)
    }
}
