import UIKit

class EventDetailViewController: UIViewController {
    private let screen = EventDetailView()
    private let viewModel: EventViewModel?

    init(viewModel: EventViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = screen
        title = String.Localizable.eventDetailViewTitle
    }
}
