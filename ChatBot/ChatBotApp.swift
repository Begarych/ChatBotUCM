//
//  ChatBotApp.swift
//  ChatBot
//
//  Created by Bahdan Rych on 15.11.24.
//

import SwiftUI

@main
struct ChatBotApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onAppear {
                    setWindowSize(width: 800, height: 600)
                }
        }
    }
}

private func setWindowSize(width: CGFloat, height: CGFloat) {
    if let window = NSApplication.shared.windows.first {
        let size = NSSize(width: width, height: height)
        window.setContentSize(size)   
        window.center()
    }
}
