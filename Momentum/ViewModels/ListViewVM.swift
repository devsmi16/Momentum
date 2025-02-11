import Foundation
import FirebaseFirestore

/// view model for list items view
/// primary lab

class ListViewVM: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    init (userId: String) {
        self.userId = userId
    }
    
    /// Delete  to do list item
    /// - Parameter id: Item id to delete
    
    func delete (id: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
            
    }
}
