//
//  Message.swift
//  demo_app
//
//  Created by Harshit Bangar on 07/04/24.
//

import Foundation

struct Message : Hashable {
    let messageText: String
    let messageSender: String
    let messageTime: Date
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(messageText)
        hasher.combine(messageSender)
        hasher.combine(messageTime)
    }
    
    static func ==(lhs: Message, rhs: Message) -> Bool {
        return lhs.messageText == rhs.messageText &&
        lhs.messageTime == rhs.messageTime &&
        lhs.messageSender == rhs.messageSender
    }
}

