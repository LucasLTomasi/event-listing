struct EventViewModel {
    let date: Int
    let description: String
    let id: String
    let image: String
    let latitude: Double
    let longitude: Double
    let price: Double
    let title: String

    init(event: Event) {
        date = event.date
        description = event.description
        id = event.id
        image = event.image
        latitude = event.latitude
        longitude = event.longitude
        price = event.price
        title = event.title
    }
}
