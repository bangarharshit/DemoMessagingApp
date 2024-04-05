//
//  ContentView.swift
//  demo_app
//
//  Created by Harshit Bangar on 01/04/24.
//

import SwiftUI

struct ContentView: View {
    
    // Generate messages with varying lastUpdatedTime
    let messages = generateMessages()


    var body: some View { // I don't understand this syntax.
        // Sort messages by lastUpdatedTime
        NavigationView {
            let sortedMessages = messages.sorted(by: { $0.lastUpdatedTime > $1.lastUpdatedTime })
            
            // Display sorted messages in a list
            List(sortedMessages, id: \.self) { message in
                MessageView(message: message)
            }
        }
    }
}
