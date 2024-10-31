import UIKit

/**
 A view that displays the photo as a circle.
 */
final class CircleImageView: UIImageView {
    // MARK: - Initialisation

    override init(frame: CGRect) {
        super.init(frame: frame)
        DispatchQueue.main.async {
            self.addRoundImageViewSetups()
        }
    }

    @available(*, unavailable) required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setups

    // MARK: Private

    private func addRoundImageViewSetups() {
        layer.cornerRadius = frame.size.width / .AppUIConstant.half
        clipsToBounds = true
        contentMode = .scaleAspectFill
    }
}
