//
//  Conversation.swift
//  Eduapp
//
//  Created by alaa gharbi on 9/12/2022.
//


import Foundation

struct Conversation {
    
    
    internal init(_id: String? = nil, lastMessage: String, lastMessageDate: Date, sender: User, receiver: User) {
        self._id = _id
        self.lastMessage = lastMessage
        self.lastMessageDate = lastMessageDate
        self.sender = sender
        self.receiver = receiver
    }
    
    var _id : String?
    var lastMessage : String
    var lastMessageDate : Date
    
    // relations
    var sender : User
    var receiver : User
}
