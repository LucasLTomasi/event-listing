import UIKit

class EventsListView: UIView {
    private let contentSpacing: CGFloat = 12

    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.startAnimating()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()

    let tableView = TableView()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
        backgroundColor = .systemBackground
    }

    private func buildViewHierarchy() {
        addSubview(tableView)
        addSubview(activityIndicator)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: contentSpacing),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: contentSpacing),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -contentSpacing),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -contentSpacing)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func hideActivityIndicator() {
        activityIndicator.isHidden = true
    }
}
