import SwiftUI
import FirebaseCore

@main
struct MomentumApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
    
    init() {
        FirebaseApp.configure()
    }
    
}
