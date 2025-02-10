import Foundation

class NewItemViewVM: ObservableObject {
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init () {}
    
    func save() {
        
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate > Date().addingTimeInterval(-86400) else {  // Şu anki tarihten 1 gün (86400 saniye) öncesini hesaplar.
            return false
        }
        
        return true
    }
}
