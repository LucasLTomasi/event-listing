import UIKit

class EventsListViewController: UIViewController {
    private let screen = EventsListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = screen
    }
}
