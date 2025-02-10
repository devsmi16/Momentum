import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewVM()
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "To Do List",
                           subtitle: "Get Things Done",
                           angle: 15,
                           backgroundColor: .blue)
                    .frame(height: 250)
                    .padding(.bottom, 20)
                
                                
                Form {
                    
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }

                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none) // büyük harf kullanımını kapatır
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    TLButton(title: "Log In",
                             backgroundColor: .blue,
                             action: {
                        
                        viewModel.login()
                        
                    })
                    .padding(.top, 10)
                }
                .frame(maxHeight: 300)
                .offset(y: -20)
                
                VStack{
                    Spacer()
                    NavigationLink("New around here? Create an account", destination: RegisterView())
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.blue)
                        .padding(.bottom, 20)
                }
                .padding(.bottom, 30)
            }
        }
    }
}

#Preview {
    LoginView()
}
