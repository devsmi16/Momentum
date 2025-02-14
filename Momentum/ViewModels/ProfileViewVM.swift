//
//  ProfileViewVM.swift
//  Momentum
//
//  Created by Sami Gündoğan on 8.02.2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewVM: ObservableObject {
    init () {}
    
    @Published var user: User? = nil
    
    func fetchUser(){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let db =  Firestore.firestore()
        db.collection("users").document(uid).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else { return }
            
            DispatchQueue.main.async {
                self?.user = User(id: data["id"] as? String ?? "",
                                  name: data["name"] as? String ?? "",
                                  email: data["email"] as? String ?? "",
                                  joined: (data["date"] as? Timestamp)?.dateValue().timeIntervalSince1970 ?? 0)
            }
        }
    }
    
    func logOut(){
        do{
            try Auth.auth().signOut()
        }catch{
            print(error )
        }
    }
}
