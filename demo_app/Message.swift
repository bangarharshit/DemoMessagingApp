//
//  Message.swift
//  demo_app
//
//  Created by Harshit Bangar on 02/04/24.
//

import Foundation

// list of struct Message -> text, image -> 10 messages
struct Message: Hashable {
    let lastSentMessage: String
    let imageName: String
    let personName: String
    let lastUpdatedTime: Date
    let unreadMessages: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(lastSentMessage)
        hasher.combine(imageName)
        hasher.combine(personName)
        hasher.combine(lastUpdatedTime)
        hasher.combine(unreadMessages)
    }
    
    static func ==(lhs: Message, rhs: Message) -> Bool {
        return lhs.lastSentMessage == rhs.lastSentMessage &&
               lhs.imageName == rhs.imageName &&
               lhs.personName == rhs.personName &&
               lhs.lastUpdatedTime == rhs.lastUpdatedTime &&
               lhs.unreadMessages == rhs.unreadMessages
    }
}

// sort messages by time
// move everything to separate class and write unit test
func generateMessages() -> [Message] {
    var messages = [Message]()
    
    // Generate messages with varying lastUpdatedTime
    let today = Date()
    let lastWeek = Calendar.current.date(byAdding: .day, value: -7, to: today)!
    let moreThanAWeekAgo = Calendar.current.date(byAdding: .day, value: -10, to: today)!
    let moreThanAYearAgo = Calendar.current.date(byAdding: .year, value: -2, to: today)!
    
    messages.append(contentsOf: [
        Message(lastSentMessage: "Today's Message", imageName: "heart", personName: "Sneha", lastUpdatedTime: today, unreadMessages: 1),
        Message(lastSentMessage: "Last Week's Message", imageName: "star", personName: "Harshit", lastUpdatedTime: lastWeek, unreadMessages: 1),
        Message(lastSentMessage: "More Than a Week Old Message", imageName: "leaf", personName: "Sneha", lastUpdatedTime: moreThanAWeekAgo, unreadMessages: 1),
        Message(lastSentMessage: "More Than a Year Old Message", imageName: "cloud", personName: "Harshit", lastUpdatedTime: moreThanAYearAgo, unreadMessages: 1),
        Message(lastSentMessage: "Today's Message", imageName: "sun.max", personName: "Sneha", lastUpdatedTime: today, unreadMessages: 1),
        Message(lastSentMessage: "Last Week's Message", imageName: "moon", personName: "Harshit", lastUpdatedTime: lastWeek, unreadMessages: 1),
        Message(lastSentMessage: "More Than a Week Old Message", imageName: "bolt", personName: "Sneha", lastUpdatedTime: moreThanAWeekAgo, unreadMessages: 1),
        Message(lastSentMessage: "More Than a Year Old Message", imageName: "cloud.bolt", personName: "Harshit", lastUpdatedTime: moreThanAYearAgo, unreadMessages: 1)
    ])
    
    return messages
}

 func imageURL(for personName: String) -> String {
        // Here, you would define the mapping of person names to image URLs
        // For example:
        switch personName {
        case "John Doe":
            return "https://example.com/john.jpg"
        case "Jane Smith":
            return "https://example.com/jane.jpg"
        default:
            return "" // Default image URL or handle unknown names
        }
    }
