import UIKit

final class ButtonTarget {
    func add(control: UIControl, action: @escaping EmptyBlock) {
        control.addTarget(self, action: #selector(controlDidTouchUpInside(_:)), for: .touchUpInside)
        actionsByControl.append(ActionByControl(control: control, action: action))
    }

    func remove(control: UIControl) {
        control.removeTarget(self, action: #selector(controlDidTouchUpInside(_:)), for: .touchUpInside)
        actionsByControl = actionsByControl.filter { $0.control !== control }
    }

    func removeControls() {
        actionsByControl.removeAll()
    }

    @objc private func controlDidTouchUpInside(_ control: UIControl) {
        actionsByControl
            .first { $0.control === control }?
            .action()
    }

    private var actionsByControl: [ActionByControl] = []
}

private struct ActionByControl {
    weak var control: UIControl?
    let action: EmptyBlock
}
