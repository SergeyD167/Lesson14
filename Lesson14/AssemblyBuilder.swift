//
//  AssemblyBuilder.swift
//  Lesson14
//
//  Created by Сергей Дятлов on 27.07.2024.
//

import SwiftUI

protocol AssemblyBuilderProtocol {
    func createMain(router: RouterProtocol) -> ViewWrapper<MainView>
    func createDetailView(comment: Comment, router: RouterProtocol) -> ViewWrapper<DetailView>
}

class AssemblyModulBuilder: AssemblyBuilderProtocol {
    func createMain(router: RouterProtocol) -> ViewWrapper<MainView> {
        let networkService = NetworkService()
        let viewModel = MainViewModel(networkService: networkService, router: router)
        let mainView = MainView(viewModel: viewModel)
        return ViewWrapper(view: mainView)
    }
    
    func createDetailView(comment: Comment, router: RouterProtocol) -> ViewWrapper<DetailView> {
        let networkService = NetworkService()
        let viewModel = DetailViewModel(networkService: networkService, router: router, comment: comment)
        let detailView = DetailView(viewModel: viewModel)
        return ViewWrapper(view: detailView)
    }
}
