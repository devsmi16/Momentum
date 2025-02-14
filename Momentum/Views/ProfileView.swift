import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewVM()
    
    var body: some View {
        NavigationView {
            
            VStack{
                if let user = viewModel.user {
                    
                    profile(user: user)
                    
                }else{
                    
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear() {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .foregroundColor(Color.indigo)
            .frame(width: 125, height: 125)
            .padding()
        
        VStack(alignment: .leading){
            HStack{
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding()
            //--
            HStack{
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            .padding()
            
            HStack{
                Text("Member since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .long, time: .shortened))")
            }
            .padding()
        }
        .padding()
        //--
        Spacer(minLength: 100)
        Button("Log Out") {
            viewModel.logOut()
        }
        .tint(.red)
        .padding()
    }
    
}

#Preview {
    ProfileView()
}
