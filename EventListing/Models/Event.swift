struct Event: Decodable, Equatable {
    let date: Int
    let description: String
    let id: String
    let image: String
    let latitude: Double
    let longitude: Double
    let price: Double
    let title: String
}
