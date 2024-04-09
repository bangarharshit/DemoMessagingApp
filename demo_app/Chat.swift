//
//  Message.swift
//  demo_app
//
//  Created by Harshit Bangar on 02/04/24.
//

import Foundation

// list of struct Message -> text, image -> 10 messages
struct Chat: Hashable {
    
    var messages: [Message] = []
    let personDP: String
    let personName: String
    let unreadMessages: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(messages)
        hasher.combine(personDP)
        hasher.combine(personName)
        hasher.combine(unreadMessages)
    }
    
    static func ==(lhs: Chat, rhs: Chat) -> Bool {
        return lhs.messages == rhs.messages &&
               lhs.personDP == rhs.personDP &&
               lhs.personName == rhs.personName &&
               lhs.unreadMessages == rhs.unreadMessages
    }
    
//    func getMessage() -> [Message] {
//        return messages.sorted(by: { $0.messageTime > $1.messageTime })
//    }
    
    mutating func appendMessage(message: Message) {
        messages.append(message)

    }
}

// sort messages by time
// move everything to separate class and write unit test
// chat_id, person_id
func generateChats() -> [Chat] {
    var messages = [Chat]()
    
    // Generate messages with varying lastUpdatedTime
    let today = Date()

    let harshitImageURL = "https://miro.medium.com/v2/resize:fit:2400/0*MdSbGPtrzTSdC0yV.jpg"
    let snehaImageURL = "https://i.pinimg.com/564x/cd/8b/c8/cd8bc81847e77dd8756693d9702159a9.jpg"
    
    messages.append(contentsOf: [
        Chat(personDP: snehaImageURL, personName: "Sneha", unreadMessages: 1),
        Chat(personDP: harshitImageURL, personName: "Harshit", unreadMessages: 1),
    ])
    
    
    return messages
}

