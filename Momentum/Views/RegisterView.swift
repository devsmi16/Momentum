import SwiftUI

struct RegisterView: View {
    
    @State var name = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            HeaderView(title: "Register",
                       subtitle: "Start organizing your tasks",
                       angle: -15,
                       backgroundColor: .green)
                .frame(height: 250)
                .padding(.bottom, 20)
            
            Form {
                TextField("Email Address", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled() // metin düzenleme özelliğini kapatır
                
                TextField("Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TLButton(title: "Create Account!", backgroundColor: .green, action: {
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
