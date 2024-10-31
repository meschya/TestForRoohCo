import UIKit

enum Alert {
    typealias Callback = () -> Void
    typealias OptionCallback = (Bool) -> Void

    static func ok(
        title: String? = nil,
        message: String? = nil,
        callback: Callback? = nil
    ) -> UIAlertController {
        let controller = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "Ok",
            style: .default) { _ in callback?() }
        controller.addAction(okAction)
        return controller
    }

    static func option(
        title: String? = nil,
        message: String? = nil,
        positive: String? = nil,
        negative: String? = nil,
        callback: @escaping OptionCallback
    ) -> UIAlertController {
        let controller = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )

        let positiveAction = UIAlertAction(title: positive ?? "Yes", style: .default) { _ in
            callback(true)
        }

        let negativeAction = UIAlertAction(title: negative ?? "No", style: .default) { _ in
            callback(false)
        }

        controller.addAction(negativeAction)
        controller.addAction(positiveAction)
        controller.preferredAction = positiveAction
        return controller
    }
}
