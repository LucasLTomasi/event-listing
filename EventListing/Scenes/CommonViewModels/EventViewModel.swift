struct EventViewModel {
    let date: String
    let description: String
    let id: String
    let image: String
    let latitude: Double
    let longitude: Double
    let price: String
    let title: String

    init(event: Event) {
        date = event.date.formattedAsDate()
        description = event.description
        id = event.id
        image = event.image
        latitude = event.latitude
        longitude = event.longitude
        price = event.price.formattedAsPrice()
        title = event.title
    }
}
