//
//  ContentView.swift
//  Lesson14
//
//  Created by Сергей Дятлов on 27.07.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var router: Router

    var body: some View {
        if let mainViewWrapper = router.assemblyBuilder?.createMain(router: router) {
            mainViewWrapper.view
        } else {
            ProgressView("Loading...").onAppear {
                router.assemblyBuilder = AssemblyModulBuilder()
                router.initialView()
            }
        }
    }
}


#Preview {
    ContentView()
}
