import Foundation
import FirebaseAuth
import FirebaseFirestore

/// view model for single to do list item view (each row in items list)

class ListItemVM: ObservableObject {
    init () {}
    
    func toggleIsDone(item: ListItem) { // task checkmark
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uId = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
