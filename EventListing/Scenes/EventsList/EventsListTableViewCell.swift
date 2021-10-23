import UIKit

class EventsListTableViewCell: UITableViewCell {
    private let contentSpacing: CGFloat = 12

    let eventTitleLabel = MultilineLabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewHierarchy()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func buildViewHierarchy() {
        addSubview(eventTitleLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            eventTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: contentSpacing),
            eventTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -contentSpacing),
            eventTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: contentSpacing),
            eventTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -contentSpacing)
        ])
    }
}
