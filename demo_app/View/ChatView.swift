import SwiftUI

struct ChatView: View {
    let chatLocal: Chat
    @State private var messages: [Message] // @State to hold the messages
    
    init(chatOutside: Chat) {
        self.chatLocal = chatOutside
        self._messages = State(initialValue: chatLocal.messages) // Initialize messages with chat's messages
    }
    
    var body: some View {
        NavigationLink(destination: ChatDetailView(messages: $messages, chat: chatLocal, imageName: chatLocal.personDP, personName: chatLocal.personName)) {
            HStack(spacing: 20) {
                AsyncImage(url: URL(string: chatLocal.personDP)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 70)
                } placeholder: {
                    ProgressView()
                }
                .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(chatLocal.personName.capitalized)
                        .font(.system(size: 18, weight: .bold))
                }
                
                Spacer()
                
                ZStack {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 20, height: 20)
                    
                    Text("\(chatLocal.unreadMessages)")
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        let chat = Chat(messages: [Message(messageText: "Hello", messageSender: "Sender", messageTime: Date())],
                        personDP: "personDP",
                        personName: "John Doe",
                        unreadMessages: 1)
        return ChatView(chatOutside: chat)
    }
}
