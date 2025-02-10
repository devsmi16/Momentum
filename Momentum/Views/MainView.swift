import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewVM()
    var body: some View {
        if viewModel.isSignedIn,
            !viewModel.currentUserId.isEmpty {
            accountView
        }else{
            LoginView()
        }
    }
    
    // computed property
    // some View ifadesi; bu view’in SwiftUI’de herhangi bir View türü olabileceğini ama tek bir view türü döndürmesi gerektiğini ifade eder
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            ListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
