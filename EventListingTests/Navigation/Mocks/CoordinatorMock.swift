@testable import EventListing
import UIKit

class CoordinatorMock {
    var pushEventDetailCallCount = 0
}

extension CoordinatorMock: EventsListCoordinator {
    func pushEventDetail(eventViewModel: EventViewModel, navigationController: UINavigationController?) {
        pushEventDetailCallCount += 1
    }
}
