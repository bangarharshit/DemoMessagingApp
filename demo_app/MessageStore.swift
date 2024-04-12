//
//  MessageStore.swift
//  demo_app
//
//  Created by Harshit Bangar on 12/04/24.
//

import Foundation




class MessageStore {
    var individualChats: [Int: [Message]] = [:]
    
    func fetchMessages(chatId:Int) -> [Message] {
        if individualChats[chatId] == nil {
            individualChats[chatId] = []
        }
        return individualChats[chatId]!
    }
    
}
