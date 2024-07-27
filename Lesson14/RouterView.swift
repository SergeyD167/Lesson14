//
//  RouterView.swift
//  Lesson14
//
//  Created by Сергей Дятлов on 27.07.2024.
//

import SwiftUI

struct RouterView<Content: View>: View {
    @StateObject var router: Router = Router.shared
    private let content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationStack(path: $router.navigationStack) {
            content
                .navigationDestination(for: ViewWrapper<DetailView>.self) { wrapper in
                    wrapper.view
                }
        }
        .environmentObject(router)
    }
}

