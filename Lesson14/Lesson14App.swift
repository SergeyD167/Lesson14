//
//  Lesson14App.swift
//  Lesson14
//
//  Created by Сергей Дятлов on 27.07.2024.
//

import SwiftUI

@main
struct WbAppSUIApp: App {
    @StateObject private var router = Router.shared

    var body: some Scene {
        WindowGroup {
            RouterView {
                ContentView()
            }
        }
    }
}

