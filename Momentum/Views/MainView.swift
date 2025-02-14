import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewVM()
    
    var body: some View {
        Group {
            if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
                accountView
                    .transition(.scale(scale: 0.9).combined(with: .opacity))
                    .animation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.3), value: viewModel.isSignedIn)
            } else {
                LoginView()
                    .transition(.move(edge: .bottom))
                    .animation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 0.3), value: viewModel.isSignedIn)
            }
        }
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
