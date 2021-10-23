import Foundation

extension Int {
    func formattedAsDate() -> String {
        let date = Date(timeIntervalSince1970: Double(self / 1000))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYY"
        let dateString = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "HH:mm"
        let timeString = dateFormatter.string(from: date)
        return "\(dateString) \(String.Localizable.eventDetailViewEventDateTimeIndicator) \(timeString)"
    }
}
