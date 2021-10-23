import UIKit

class EventsListTableViewCell: UITableViewCell {
    private let contentSpacing: CGFloat = 12
    private let eventTitleLabel = MultilineLabel()

    var viewModel: EventViewModel? {
        didSet {
            updateCellContent()
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewHierarchy()
        setupConstraints()
        accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
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
            eventTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -contentSpacing * 4),
            eventTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: contentSpacing),
            eventTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -contentSpacing)
        ])
    }

    private func updateCellContent() {
        eventTitleLabel.text = viewModel?.title
    }
}
