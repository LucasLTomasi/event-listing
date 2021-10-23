import UIKit

class EventDetailView: UIView {
    private let contentSpacing: CGFloat = 18

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
    }

    private func buildViewHierarchy() {
        containerView.addArrangedSubview(titleStackView)
        containerView.addArrangedSubview(descriptionStackView)
        containerView.addArrangedSubview(dateStackView)
        containerView.addArrangedSubview(priceStackView)
        scrollView.addSubview(containerView)
        addSubview(scrollView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
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
