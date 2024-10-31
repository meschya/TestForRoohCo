import SwiftUI

@main
struct TestForRoohCoWatch_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(name: AppCaption.mockName,
                        age: Date.now,
                        weight: 40,
                        image:  UIImage(named:  "avatar_1")!)
        }
    }
}
