//
//  ContentView.swift
//  demo_app
//
//  Created by Harshit Bangar on 01/04/24.
//

import SwiftUI

struct ChatListView: View {
    
    // Generate messages with varying lastUpdatedTime
    @State private var chats: [Chat] = generateChats() // Assuming you have a function to generate sample chats/
    
    
    var body: some View {
        NavigationView {
            List(chats, id: \.self) { chat in // using lambda
                ChatView(chatOutside: chat)
            }
//            List(chats, id: \.self, rowContent: createChatsView)   //higher order function
            
        }
    }
}

//func createChatsView(chat: Chat) -> ChatView  {   // higher order function
//    ChatView(chatOutside: chat)
//}

struct ChatRow: View {
    let chat: Chat
    
    var body: some View {
        HStack {
                // Display chat information here
                // For example:
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 50, height: 50)
                .padding(.trailing, 10)
            Text(chat.personName)
        }
    }
}

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
            // Create a preview with the ChatListView
        ChatListView()
    }
}
