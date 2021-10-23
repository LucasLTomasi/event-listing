import RxCocoa
import RxSwift
import UIKit

class EventsListViewController: UIViewController {
    private let screen = EventsListView()
    private let viewModel: EventsListViewModel?
    private let disposeBag = DisposeBag()

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
        viewModel?.getEvents(tableView: screen.tableView)
        bindViewModel()
        setupCellSelection()
    }

    private func bindViewModel() {
        viewModel?
            .events
            .bind(to: screen.tableView.rx.items(cellIdentifier: String(describing: EventsListTableViewCell.self),
                                                cellType: EventsListTableViewCell.self)) { _, event, cell in
                cell.viewModel = EventsListTableViewCellViewModel(title: event.title)
            }
            .disposed(by: disposeBag)
    }

    private func setupCellSelection() {
        screen.tableView
            .rx
            .itemSelected
            .subscribe(
                onNext: { [weak self] indexPath in
                    let cell = self?.screen.tableView.cellForRow(at: indexPath) as? EventsListTableViewCell
                    print(cell)
                }
            )
            .disposed(by: disposeBag)
    }
}
