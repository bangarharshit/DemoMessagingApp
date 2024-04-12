//
//  Message.swift
//  demo_app
//
//  Created by Harshit Bangar on 02/04/24.
//

import Foundation

// list of struct Message -> text, image -> 10 messages
struct Chat: Hashable {
    
    let chatId: Int
    let person: PersonDetails
    let unreadMessages: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(chatId)
        hasher.combine(person)
        hasher.combine(unreadMessages)
    }
    
    static func ==(lhs: Chat, rhs: Chat) -> Bool {
        return lhs.chatId == rhs.chatId &&
               lhs.person == rhs.person &&
               lhs.unreadMessages == rhs.unreadMessages
    }
}

// sort messages by time
// move everything to separate class and write unit test
// chat_id, person_id
func generateChats() -> [Chat] {
    var totalChats = [Chat]()
    
    // Generate messages with varying lastUpdatedTime
    let today = Date()

    
    totalChats.append(contentsOf: [
        Chat(chatId: 1, person: PersonDetails(name: "Sneha", profilePicUrl: "https://i.pinimg.com/564x/cd/8b/c8/cd8bc81847e77dd8756693d9702159a9.jpg"), unreadMessages: 1),
        Chat(chatId: 2, person: PersonDetails(name: "Harshit", profilePicUrl: "https://miro.medium.com/v2/resize:fit:2400/0*MdSbGPtrzTSdC0yV.jpg"), unreadMessages: 1),
    ])
    
    
    return totalChats
}

