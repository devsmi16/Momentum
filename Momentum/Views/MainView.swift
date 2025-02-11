import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewVM()
    
    var body: some View {
        Group {
            if viewModel.isSignedIn,
                !viewModel.currentUserId.isEmpty {
                accountView
                    .transition(.opacity.combined(with: .scale))
            } else {
                LoginView()
                    .transition(.move(edge: .bottom))
            }
        }
        .animation(.easeInOut, value: viewModel.isSignedIn)
    }

    @ViewBuilder
    var accountView: some View {
        TabView {
            ListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Ana Sayfa", systemImage: "house.fill")
                }
            
            PomodoroView()
                .tabItem {
                    Label("Pomodoro", systemImage: "clock.fill")
                }

            ProfileView()
                .tabItem {
                    Label("Profil", systemImage: "person.crop.circle.fill")
                }
            
        }
        .tint(.blue) 
    }
}

#Preview {
    MainView()
}
