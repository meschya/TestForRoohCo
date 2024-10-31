import UIKit

extension UIButton {
    override open var state: UIControl.State {
        switch super.state {
        case .highlighted:
            alpha = 0.8
        case .normal:
            alpha = 1
        default:
            break
        }
        return super.state
    }
}
