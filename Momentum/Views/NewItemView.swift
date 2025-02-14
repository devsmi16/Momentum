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
            
            
            Form {
                Section {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(viewModel.title.isEmpty ? Color.gray.opacity(0.5) : Color.orange, lineWidth: 2)
                            .background(Color(UIColor.secondarySystemBackground))
                            .cornerRadius(10)
                        
                        HStack {
                            Image(systemName: "square.and.pencil")
                                .foregroundColor(viewModel.title.isEmpty ? .gray : .orange)
                            
                            TextField("Add event...", text: $viewModel.title)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                                .padding(10)
                        }
                        .padding(.horizontal, 10)
                    }
                    .frame(height: 50)
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
