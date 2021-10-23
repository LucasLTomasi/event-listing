import RxCocoa
import RxSwift
import UIKit

class EventsListViewController: UIViewController {
    let screen = EventsListView()
    private let viewModel: EventsListViewModelProtocol?
    private let coordinator: EventsListCoordinator?
    private let disposeBag = DisposeBag()

    init(viewModel: EventsListViewModelProtocol, coordinator: EventsListCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = screen
        setupNavigationBar()
        viewModel?.getEvents()
        bindViewModel()
        setupCellSelection()
    }

    private func setupNavigationBar() {
        title = String.Localizable.eventsListViewTitle
        let backItem = UIBarButtonItem()
        backItem.title = String.Localizable.eventsListBackButtonText
        navigationItem.backBarButtonItem = backItem
    }

    private func bindViewModel() {
        viewModel?
            .events
            .bind(to: screen.tableView.rx.items(cellIdentifier: String(describing: EventsListTableViewCell.self),
                                                cellType: EventsListTableViewCell.self)) { _, event, cell in
                self.screen.hideActivityIndicator()
                cell.viewModel = EventViewModel(event: event)
            }
            .disposed(by: disposeBag)
    }

    private func setupCellSelection() {
        screen.tableView
            .rx
            .itemSelected
            .subscribe(
                onNext: { [weak self] indexPath in
                    guard let cell = self?.screen.tableView.cellForRow(at: indexPath) as? EventsListTableViewCell,
                          let cellViewModel = cell.viewModel else { return }
                    self?.coordinator?.pushEventDetail(eventViewModel: cellViewModel, navigationController: self?.navigationController)
                }
            )
            .disposed(by: disposeBag)
    }
}
