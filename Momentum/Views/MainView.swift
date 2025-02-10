import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewVM()
    var body: some View {
        if viewModel.isSignedIn,
            !viewModel.currentUserId.isEmpty {
            // signed in
            ListView()
        }else{
            LoginView()
        }
    }
}

#Preview {
    MainView()
}
