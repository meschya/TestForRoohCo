import SwiftUI

struct NumberField: View {
    // MARK: - Properties

    var title: String
    
    @Binding var number: Int
    
    var placeholder: String 
    
    // MARK: - UIConstants
    
    private let spacing: CGFloat = 5
    
    private let fontSizeForText: CGFloat = 12
    
    private let fontSizeForTextField: CGFloat = 14
    
    private let heightForTextField: CGFloat = 9
    
    private let rageWeight = 40...160
    
    // MARK: - View

    var body: some View {
        HStack(spacing: spacing) {
            Text(title)
                .font(.system(size: fontSizeForText,
                              weight: .regular))
            TextField(title, value: $number, formatter: NumberFormatter())
                .font(.system(size: fontSizeForTextField))
                .frame(height: heightForTextField)
                .disabled(true)
            Stepper(value: $number, in: rageWeight) {
                        EmptyView()
                    }
                
        }
    }
}
