import SwiftUI

struct PersonImage: View {
    // MARK: - UIConstant
    
    private let sizeForImage: CGFloat = 50
    
    @State var image: UIImage
    
    // MARK: - View
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .frame(width: sizeForImage,
                   height: sizeForImage)
    }
}

#Preview {
    PersonImage(image: UIImage(named: "avatar_1")!)
}
