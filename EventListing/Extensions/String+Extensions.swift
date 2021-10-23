import Foundation

extension String {
    enum Localizable {
        // Errors
        static let urlCreationError = NSLocalizedString("url_creation_error", comment: "")
        static let nullDataError = NSLocalizedString("null_data_error", comment: "")
        static let decodingError = NSLocalizedString("decoding_error", comment: "")
        static let genericApiError = NSLocalizedString("generic_api_error", comment: "")
        static let noInternetConnection = NSLocalizedString("no_internet_connection", comment: "")

        // Events List View
        static let eventsListViewTitle = NSLocalizedString("events_list_view_title", comment: "")
        static let eventsListViewPlaceholderText = NSLocalizedString("events_list_view_placeholder_text", comment: "")
        static let eventsListBackButtonText = NSLocalizedString("events_list_back_button_text", comment: "")

        // Event Detail View
        static let eventDetailViewTitle = NSLocalizedString("event_detail_view_title", comment: "")
    }
}
