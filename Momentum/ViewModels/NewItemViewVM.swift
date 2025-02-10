import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewVM: ObservableObject {
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init () {}
    
    func save() {
        guard canSave else {
            return
        }
        
        // get current user id
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        // create model
        let newId = UUID().uuidString
        let newItem = ListItem(id: newId,
                               title: title,
                               dueDate: dueDate.timeIntervalSince1970,
                               createdDate: Date().timeIntervalSince1970,
                               isDone: false)
        
        
        // save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
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
