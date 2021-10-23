import UIKit

class TableView: UITableView {
    init() {
        super.init(frame: .zero, style: .plain)
        translatesAutoresizingMaskIntoConstraints = false
        tableFooterView = UIView()
        register(EventsListTableViewCell.self, forCellReuseIdentifier: String(describing: EventsListTableViewCell.self))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
