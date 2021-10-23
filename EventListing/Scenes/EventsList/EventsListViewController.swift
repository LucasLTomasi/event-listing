import UIKit

class EventsListViewController: UIViewController {
    private let screen = EventsListView()
    private let viewModel: EventsListViewModel?

    init(viewModel: EventsListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = screen
        viewModel?.getEvents()
    }
}
