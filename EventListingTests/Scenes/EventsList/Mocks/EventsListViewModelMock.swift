@testable import EventListing
import RxSwift
import UIKit

class EventsListViewModelMock: EventsListViewModelProtocol {
    var getEventsCallCount = 0

    var events: PublishSubject<[EventListing.Event]> = PublishSubject()

    func getEvents() {
        getEventsCallCount += 1
    }
}
