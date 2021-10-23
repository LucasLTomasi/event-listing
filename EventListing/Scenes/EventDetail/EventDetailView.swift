import UIKit

class EventDetailView: UIView {
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
        backgroundColor = .systemBackground
    }

    private func buildViewHierarchy() {}

    private func setupConstraints() {}

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
