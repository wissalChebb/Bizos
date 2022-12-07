//
//  MessageMnager.swift
//  Memorize
//
//  Created by Apple Esprit on 7/12/2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
class MessageManger : ObservableObject{
    @Published private (set) var message:[Message] = []
    let db = Firestore.firestore()
    init()
    {
        getMessages()
    }
    func getMessages(){
        db.collection("messages").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else
            {
                print("error fetching documents:\(String(describing: error))")
                return
            }
            self.message = documents.compactMap{ document -> Message? in
                do{
                    return try document.data(as: Message.self)
                }catch{
                    print("Error decoding document \(error)")
                    return nil
                }
                
            }
            self.message.sort{
                $0.timestamp < $1.timestamp
            }
        }
    }
    
}

