//
//  ContentView.swift
//  ChatBot
//
//  Created by Bahdan Rych on 15.11.24.
//

import SwiftUI

struct ContentView: View {
    // @State private var isLoggedIn = false
    @ObservedObject var bot = ChatBot()
    
    var body: some View {
        if bot.isLoggedIn {
            ChatBotView()
        }else {
            RegistrationView(isLoggedIn: $bot.isLoggedIn, showAlert: $bot.showAlert)
        }
    }
}

struct RegistrationView: View {
    @ObservedObject var bot = ChatBot()
    @ObservedObject var user = User()
    @Binding var isLoggedIn: Bool
    @Binding var showAlert: Bool
    @State private var scale: CGFloat = 1.0
    @State private var username: String = ""
    @State private var password: String = ""
    
    

    var body: some View {
        VStack {
            Text("ChatBotUCM")
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .foregroundStyle(
                    LinearGradient(
                        colors: [.blue, .purple],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
//                .font(.largeTitle)
//                .fontWeight(.bold)
//                .foregroundColor(.orange)
//                .scaleEffect(scale)
//                .onAppear {
//                    withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
//                        scale = 1.2
//                    }
//                }
                
            Text("Login")
                .font(.largeTitle)
                .padding()

            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                user.set_name(str: username)
                user.set_pass(str: password)
                bot.register(username: user.username, password: user.password)
                if bot.isLoggedIn {
                    isLoggedIn = true
                }
            }){
                Text("Start")
                    .padding(0.9)
                    .foregroundColor(.black)
                    .cornerRadius(8)
            }
            .alert(isPresented: $bot.showAlert) {
                Alert(title: Text("Error"), message: Text("Please enter valid username and password"), dismissButton: .default(Text("OK")))
            }

            Spacer()
        }
        .padding()
    }

    private func register() {
        guard !username.isEmpty && !password.isEmpty else {
            showAlert = true
            return
        }
        isLoggedIn = true // Successful registration simulation
    }
}

struct ChatBotView: View {
    @ObservedObject var bot = ChatBot()
    @State private var messages: [String] = []
    @State private var userInput: String = ""

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("ChatBotUCM")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                    ForEach(bot.messages, id: \.self) { message in
                        Text(message)
                            .padding(10)
                            .background(message.starts(with: "You:") ? Color.blue.opacity(0.3) : Color.gray.opacity(0.3), alignment: .leading)
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .foregroundColor(.black)
                    }
                }
            }
            .background(Color.white)

            HStack {
                TextField("Type your message...", text: $bot.userInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .onSubmit {
                        bot.sendMessage()
                    }

                Button(action: bot.sendMessage) {
                    Text("Send")
                        .padding()
                        // .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)

                }
                .keyboardShortcut(.return, modifiers: [])
            }
            .padding()
        }
        .navigationTitle("Chatbot")
    }

    private func sendMessage() {
        guard !userInput.isEmpty else { return }
        messages.append("You: \(userInput)")
        userInput = ""

        let response = "Bot: This is a simulated response."
        messages.append(response)
    }
}



