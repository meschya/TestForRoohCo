import SwiftUI

struct InfoField: View {
    // MARK: - Properties
    
    var title: String
    
    @Binding var text: String
    
    var placeholder: String
    
    // MARK: - UIConstants
    
    private let fontSizeForTitle: CGFloat = 12
    
    private let spacing: CGFloat = 10
    
    private let fontSizeForTextField: CGFloat = 14
    
    private let heightForTextField: CGFloat = 9
    
    // MARK: - View
    
    var body: some View {
        HStack(spacing: spacing) {
            Text(title)
                .font(.system(size: fontSizeForTitle,
                              weight: .regular))
            TextField(placeholder, text: $text)
                .font(.system(size: fontSizeForTextField))
                .frame(height: heightForTextField)
            
        }
    }
}
