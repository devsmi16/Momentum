import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewVM()
    var body: some View {
        VStack {
            HeaderView(title: "Register",
                       subtitle: "Stay on track, achieve more",
                       angle: -15,
                       backgroundColor: .green)
                .frame(height: 250)
                .padding(.bottom, 20)
            
            Form {
                TextField("Name", text: $viewModel.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled() // metin düzenleme özelliğini kapatır
                
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TLButton(title: "Create Account!", backgroundColor: .green, action: {
                    viewModel.register()
                    // Register action
                })
                .padding(.top, 10)
            }
            .frame(maxHeight: 300)
            .offset(y: -20)
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
