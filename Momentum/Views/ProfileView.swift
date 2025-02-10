import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewVM()
    
    init(){}
    
    var body: some View {
        NavigationView {
            VStack{
                
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
