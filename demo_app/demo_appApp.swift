//
//  demo_appApp.swift
//  demo_app
//
//  Created by Harshit Bangar on 01/04/24.
//

import SwiftUI

@main
struct demo_appApp: App {
    var messageStore = MessageStore()
    var body: some Scene {
        WindowGroup {
            ChatListView(messageStoreLocal: messageStore)
        }
    }
}
