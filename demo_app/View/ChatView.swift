import SwiftUI

struct ChatView: View {
    let chatLocal: Chat
    @State private var messages: [Message] // @State to hold the messages
    
    init(chatOutside: Chat, messageStore: MessageStore) {
        self.chatLocal = chatOutside
        self.messages = messageStore.fetchMessages(chatId: chatOutside.chatId)
    }
    
    var body: some View {
        NavigationLink(destination: ChatDetailView(messages: $messages, chat: chatLocal, imageName: chatLocal.person.profilePicUrl, personName: chatLocal.person.name)) {
            HStack(spacing: 20) {
                AsyncImage(url: URL(string: chatLocal.person.profilePicUrl)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 70)
                } placeholder: {
                    ProgressView()
                }
                .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(chatLocal.person.name.capitalized)
                        .font(.system(size: 18, weight: .bold))
                    Text(messages.last?.messageText ?? "")  //TODO
                        .font(.system(size: 18, weight: .bold))
                }
                
                Spacer()
                
                ZStack {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 20, height: 20)
                    
                    Text("\(messages.count)")
                        .foregroundColor(.white)
                }
            }
        }
    }
}
