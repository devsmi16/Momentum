import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewVM()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            // Title section
            Text("New Task")
                .font(.largeTitle)
                .bold()
                .padding(.top, 40)
            
            Spacer(minLength: 20)
            
            // Main form for title and due date
            Form {
                Section {
                    // Title input
                    TextField("Title", text: $viewModel.title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.vertical, 5)
                }
                
                Section {
                    // Due date picker
                    DatePicker("", selection: $viewModel.dueDate, in: Date()...)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .labelsHidden()
                        .padding(.vertical, 5)
                }
                
                Section {
                    Button(action: {
                        if viewModel.canSave {
                            viewModel.save()
                            newItemPresented = false
                        } else {
                            viewModel.showAlert = true
                        }
                    }) {
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                            Text("Save")
                                .fontWeight(.bold)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(viewModel.canSave ? Color.orange : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .disabled(!viewModel.canSave)
                }
            }
            .padding(.top, 20)
            
            Spacer()
            
        }
        .navigationBarBackButtonHidden(true)
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Error"),
                  message: Text("Please fill in all fields and select a valid date."),
                  dismissButton: .default(Text("OK")))
        }
    }
}

#Preview {
    NewItemView(newItemPresented: .constant(true))
}
