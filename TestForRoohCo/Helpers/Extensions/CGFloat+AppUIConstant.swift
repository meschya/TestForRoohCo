import Foundation

extension CGFloat {
    /// The settings of the UI element used in the application.
    enum AppUIConstant {
        /// A base corner radius.
        static let baseCornerRadius: CGFloat = 26
        /// A minimal corner radius.
        static let minCornerRadius: CGFloat = 6

        /// An opacity setting used for the transparent view.
        static let transparent: Double = 0.0
        /// An opacity setting used for the semitransparent view.
        static let semitransparent: Double = 0.5
        /// An opacity setting used for the opaque view.
        static let opaque: Double = 1.0

        /// A value to get half of some value.
        static let half: CGFloat = 2

        /// A base top indent.
        static let baseTopIndent: CGFloat = 10
        /// A base side indent.
        static let baseSideIdent: CGFloat = 15
        /// A regular side indent.
        static let regularSideIdent: CGFloat = 30
    }
}
