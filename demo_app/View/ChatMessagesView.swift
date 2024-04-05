//
//  ChatMessages.swift
//  demo_app
//
//  Created by Harshit Bangar on 02/04/24.
//

import Foundation
import SwiftUI

struct ChatMessagesView: View {
    let imageName: String
    let personName: String
    let text: String
    
    //    let message: Message
    
    @State private var isRowSelected = false
    
    var body: some View {
        VStack(spacing: 20) {
            // content here
            MessageBody(text: text)
        }
        .navigationBarTitle(text, displayMode: .inline)
        .navigationBarItems(leading: CustomNavigationTitleView(imageName: imageName, personName: personName))
    }
}



struct CustomNavigationTitleView: View {
    let imageName: String
    let personName: String

    var body: some View {
            HStack(spacing: 20) {
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor(.primary)
                
                Text(personName)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(1)
                
                Spacer() // Spacer to push the camera and phone icons to the right
                
                Image(systemName: "camera.fill")
                    .foregroundColor(.blue)
                
                Image(systemName: "phone.fill")
                    .foregroundColor(.green)
            }
        }
    }

struct MessageBody: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.headline)
            .foregroundColor(.primary)
    }
}
