//
//  engine.swift
//  ChatBot
//
//  Created by Bahdan Rych on 15.11.24.
//

import Foundation
import SwiftUI

class User: ObservableObject {
    var username: String = ""
    var password: String = ""
    
    init() {
        self.username = ""
        self.password = ""
    }
    
    func set_pass(str: String) {
        self.password = str
    }
    
    func set_name(str: String) {
        self.username = str
    }
}

class ChatBot: ObservableObject {
    var username: String = ""
    var password: String = ""
    @Published var showAlert: Bool = false
    @Published var isLoggedIn: Bool = false
    @Published var messages: [String] = []
    @Published var userInput: String = ""



    init() {
        self.userInput = ""
        self.showAlert = false
        self.isLoggedIn = false
        self.messages = []
    }

    func register(username: String, password: String) {
        guard !username.isEmpty && !password.isEmpty else {
            showAlert = true
            return
        }

        for (key, value) in login_strc {
            if key == username && value == password {
                break
            }else{
                showAlert = true
                return
            }
        }
        isLoggedIn = true
    }

    func sendMessage() {
        guard !self.userInput.isEmpty else { return }
        self.messages.append("You: \(self.userInput)")
        self.messages.append(respond(to: self.userInput))
        self.userInput = ""
    }

    func respond(to message: String) -> String {
        let lowercasedMessage = message.lowercased()
        let wordsInMessage = Set(lowercasedMessage.split(separator: " ").map { String($0) })
        let calendar = Calendar.current
        let today = Date()
        let weekday = calendar.component(.weekday, from: today)

        // bag with "?"
        if wordsInMessage.contains("dnes"){
            return "Dneska mas taki to hodiny:\n \(schedule[weekday] ?? "error")"
        }

        if wordsInMessage.contains("zajtra"){
            return "Mas zajtra taki to rozvrh: \n \(schedule[weekday+1] ?? schedule[1] ?? "Error")"
        }

        for (requiredKeywords, response) in requiredKeywordResponses {
            if requiredKeywords.isSubset(of: wordsInMessage) {
                return response
            }
        }

        for (keywords, response) in responses {
            if keywords.contains(where: { lowercasedMessage.contains($0) }) {
                return response
            }
        }

        return "Prepáčte, nerozumiem tomu."
    }
}

