import UIKit

class EventsListView: UIView {
    private let contentSpacing: CGFloat = 12

    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.startAnimating()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()

    private let networkConnectionBanner = ErrorBannerView()
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
        addSubview(networkConnectionBanner)
    }

    private func setupConstraints() {
        networkConnectionBanner.bannerHeight = networkConnectionBanner.heightAnchor.constraint(equalToConstant: 0)
        networkConnectionBanner.bannerHeight?.isActive = true
        NSLayoutConstraint.activate([
            networkConnectionBanner.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            networkConnectionBanner.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            networkConnectionBanner.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            networkConnectionBanner.bottomAnchor.constraint(equalTo: tableView.topAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
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

    func updateNetworkConnectionErrorVisibility(shouldHide: Bool) {
        print("should hide \(shouldHide)")
        networkConnectionBanner.update(shouldHide: shouldHide) {
            self.layoutIfNeeded()
        }
    }
}
