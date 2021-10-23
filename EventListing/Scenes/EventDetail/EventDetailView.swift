import UIKit

class EventDetailView: UIView {
    private let contentSpacing: CGFloat = 18

    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.startAnimating()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let containerView: UIStackView = {
        let containerView = UIStackView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.axis = .vertical
        containerView.spacing = 15
        return containerView
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemGray5
        return imageView
    }()

    private let titleStackView = TitleAndContentStackView(titleLabel: MultilineLabel(String.Localizable.eventDetailViewEventTitle))
    private let descriptionStackView = TitleAndContentStackView(titleLabel: MultilineLabel(String.Localizable.eventDetailViewEventDescription))
    private let dateStackView = TitleAndContentStackView(titleLabel: MultilineLabel(String.Localizable.eventDetailViewEventDate))
    private let priceStackView = TitleAndContentStackView(titleLabel: MultilineLabel(String.Localizable.eventDetailViewEventPrice))

    init(viewModel: EventViewModel) {
        super.init(frame: .zero)
        titleStackView.setContentText(viewModel.title)
        descriptionStackView.setContentText(viewModel.description)
        dateStackView.setContentText(viewModel.date)
        priceStackView.setContentText(viewModel.price)
        buildViewHierarchy()
        setupConstraints()
        backgroundColor = .systemBackground
        imageView.load(url: URL(string: viewModel.image)) { [weak self] in
            self?.activityIndicator.isHidden = true
        }
    }

    private func buildViewHierarchy() {
        imageView.addSubview(activityIndicator)
        containerView.addArrangedSubview(imageView)
        containerView.addArrangedSubview(titleStackView)
        containerView.addArrangedSubview(descriptionStackView)
        containerView.addArrangedSubview(dateStackView)
        containerView.addArrangedSubview(priceStackView)
        scrollView.addSubview(containerView)
        addSubview(scrollView)
    }

    private func setupConstraints() {
        let aspectRatio: CGFloat = 16/9
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1.0 / aspectRatio),
            activityIndicator.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: contentSpacing),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: contentSpacing),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -contentSpacing),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -contentSpacing),
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
