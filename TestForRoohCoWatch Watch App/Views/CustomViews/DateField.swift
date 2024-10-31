import SwiftUI

struct DateField: View {
    // MARK: - Properties

    var title: String
    
    @Binding var date: Date
    
    // MARK: - UIConstants
    
    private let spacing: CGFloat = 5
    
    private let fontSizeForText: CGFloat = 12
    
    // MARK: - View

    var body: some View {
        HStack(spacing: spacing) {
            Text(title)
                .font(.system(size: fontSizeForText,
                              weight: .regular))
            DatePicker(AppCaption.when,
                       selection: $date)
        }
    }
}
