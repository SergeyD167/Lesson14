//
//  Router.swift
//  Lesson14
//
//  Created by Сергей Дятлов on 27.07.2024.
//

import SwiftUI

protocol RouterMain {
    var navigationStack: NavigationPath { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMain {
    func initialView()
    func showDetail(comment: Comment?)
    func popToRoot()
}

class Router: ObservableObject, RouterProtocol {
    static let shared = Router()
    
    @Published var navigationStack = NavigationPath()
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    private init() {}
    
    func initialView() {
        if let mainViewWrapper = assemblyBuilder?.createMain(router: self) {
            navigationStack = NavigationPath()
            navigationStack.append(mainViewWrapper)
        }
    }
    
    func showDetail(comment: Comment?) {
        if let comment = comment, let detailViewWrapper = assemblyBuilder?.createDetailView(comment: comment, router: self) {
            navigationStack.append(detailViewWrapper)
        }
    }
    
    func popToRoot() {
        navigationStack = NavigationPath()
    }
}


