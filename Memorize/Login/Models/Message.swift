//
//  Messqge.swift
//  Eduapp
//
//  Created by alaa gharbi on 9/12/2022.
//

import Foundation
import MessageKit

struct Sender: SenderType {
    var senderId: String
    var displayName: String
}

struct Message : MessageType {
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
    
    // relations
   // var conversationEnvoyeur : Conversation
   // var conversationRecepteur : Conversation
}
