import SwiftUI

struct ChatDetailView: View {
    
    @Binding var messages: [Message] // Change binding type to [Message]
    let chat: Chat
//    @State private var messages: [Message]
    let imageName: String
    let personName: String
    
    @State private var newMessage = ""
    
//    init(chat: Chat, messages: [Message], imageName: String, personName: String) {
//        self.chat = chat
//        self._messages = State(initialValue: messages)
//        self.imageName = imageName
//        self.personName = personName
//    }
    
    
    
    var body: some View {
        VStack(spacing: 20) {
            ListView(messages: messages) // Pass messages binding to ListView
            HStack {
                TextField("Type a message", text: $newMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Button(action: sendMessage) { // action -> higherorderfunction, label -> higherorder function, lambda
                    Text("Send")
                }
//                Button(action: sendMessage, label: createButtonsView)
//                .padding(.trailing)
            }
            .padding()
        }
        .navigationBarItems(leading: CustomNavigationTitleView(imageName: imageName, personName: personName))
    }
    
//    func createButtonsView() -> Text {
//        Text("Send")
//        return Text("Send")
//    }
//    
    func sendMessage() {
        if !newMessage.isEmpty {
            let message = Message(messageText: newMessage, messageSender: "Me", messageTime: Date())
            messages.append(message)
            newMessage = ""
        }
    }

}

struct ListView: View {
    let messages: [Message] // Change messages type to [Message]
    
    var body: some View {
        List(messages, id: \.self) { message in
            Text(message.messageText) // Use message property to display text
                .padding(8)
                .background(Color.gray)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .foregroundColor(.white)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .listRowInsets(EdgeInsets())
        }
        .padding(.vertical, 10)
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

struct ChatDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let chat = Chat(messages: [Message(messageText: "Hello", messageSender: "Sender", messageTime: Date())],
                        personDP: "personDP",
                        personName: "John Doe",
                        unreadMessages: 0)
        return ChatDetailView(messages: .constant(chat.messages), chat: chat, imageName: chat.personDP, personName: chat.personName)
    }
}
