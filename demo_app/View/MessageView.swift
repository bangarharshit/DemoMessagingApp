//
//  MessageRow.swift
//  demo_app
//
//  Created by Harshit Bangar on 02/04/24.
//

import Foundation
import SwiftUI

struct MessageView: View {
    let message: Message
    // if today's data -> use time
    // if last week's data -> use weekday
    // if more than a week old -> use day
    // if more than an year old -> show year
    let formatter = DynamicDateFormatter()

    
    var body: some View {
        
        NavigationLink(destination: ChatMessagesView(imageName: message.imageName, personName: message.personName, text: message.lastSentMessage)){
        
        HStack(spacing: 20) {
            // TODO - Use actual image from internet. you can use any image loading library
            
            AsyncImage(url: URL(string: "https://miro.medium.com/v2/resize:fit:2400/0*MdSbGPtrzTSdC0yV.jpg")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                        } placeholder: {
                            ProgressView()
                        }
                        .clipShape(Circle())
                        .padding()
            
            VStack(alignment: .leading, spacing: 10) {
                Text(message.personName.capitalized)
                    .font(.system(size: 14, weight: .bold)) // Bold and slightly bigger font for personName

                             
                Text(message.lastSentMessage.capitalized) // Initial caps for text
                    .font(.system(size: 9, weight: .light)) // Smaller font for text
                    .lineLimit(1) // Limit to one line
                                        .truncationMode(.tail)
            }
            
            Spacer()
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack {
                Text(formatter.string(from: message.lastUpdatedTime))
                    .foregroundColor(.blue)
                
                // Move it out to circle text view and include it here.
                ZStack {
                    Circle()
                        .fill(Color.blue) // Circle color
                        .frame(width: 20, height: 20) // Circle size
                    
                    Text("\(message.unreadMessages)")
                        .foregroundColor(.white) // Text color
                }
            }
        }
        }
    }
}

