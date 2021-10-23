extension Double {
    func formattedAsPrice() -> String {
        return "R$ " + String(format: "%.2f", self).replacingOccurrences(of: ".", with: ",")
    }
}
