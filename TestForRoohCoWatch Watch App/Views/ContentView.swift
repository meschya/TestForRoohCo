import SwiftUI
import WatchConnectivity

struct ContentView: View {
    // MARK: - Properties
    
    @State var name: String
    
    @State var age: Date
    
    @State var weight: Int
    
    @State var image: UIImage
    
    private let dateFormatter = DateFormatter()
    
    @StateObject private var watchConnector = WatchToiOSConnector()
    
    // MARK: - UIConstants
    
    private let heightForDateField: CGFloat = 100
    
    private let spacing: CGFloat = 50
    
    // MARK: - View
    
    var body: some View {
        ScrollView {
            VStack(spacing: spacing) {
                PersonImage(image: image)
                InfoField(title: AppCaption.name,
                          text: $name,
                          placeholder: AppCaption.enterYourName)
                DateField(title: AppCaption.age, date: $age)
                    .frame(height: heightForDateField)
                NumberField(title: AppCaption.weight, number: $weight,
                            placeholder: AppCaption.enterYourWeight)
                Button {
                    watchConnector.sendPersonToiOS(getPerson())
                } label: {
                    Text(AppCaption.send)
                }
                
            }
            .padding()
        }
    }
    
    func getPerson() -> Person {
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = "dd/mm/yy"
        let ageDate = dateFormatter.string(from: age)
        let weightString = "\(weight)"
        let person = Person(name: name,
                            age: ageDate,
                            weight: weightString,
                            image: image)
        return person
    }
}

#Preview {
    ContentView(name: AppCaption.mockName,
                age: Date.now,
                weight: 40,
                image:  UIImage(named:  "avatar_1")!)
}
