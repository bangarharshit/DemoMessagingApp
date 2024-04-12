//
//  ContentView.swift
//  demo_app
//
//  Created by Harshit Bangar on 01/04/24.
//

import SwiftUI

struct ChatListView: View {
    var messageStoreLocal:MessageStore
    
    // Generate messages with varying lastUpdatedTime
    @State private var chats: [Chat] = generateChats() // Assuming you have a function to generate sample chats/
    
    
    var body: some View {
        NavigationView {
            List(chats, id: \.self) { chat in // using lambda
                ChatView(chatOutside: chat, messageStore: messageStoreLocal)
            }
//            List(chats, id: \.self, rowContent: createChatsView)   //higher order function
            
        }
    }
}

//func createChatsView(chat: Chat) -> ChatView  {   // higher order function
//    ChatView(chatOutside: chat)
//}

//struct ChatListView_Previews: PreviewProvider {
//    static var previews: some View {
//            // Create a preview with the ChatListView
//        ChatListView()
//    }
//}
