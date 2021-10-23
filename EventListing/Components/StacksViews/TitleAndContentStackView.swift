import UIKit

class TitleAndContentStackView: UIStackView {
    let contentLabel: MultilineLabel

    init(titleLabel: MultilineLabel) {
        contentLabel = MultilineLabel()
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        addArrangedSubview(titleLabel)
        addArrangedSubview(contentLabel)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setContentText(_ text: String) {
        contentLabel.text = text
    }
}
