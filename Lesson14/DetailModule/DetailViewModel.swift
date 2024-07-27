//
//  DetailViewModel.swift
//  Lesson14
//
//  Created by Сергей Дятлов on 27.07.2024.
//

import Foundation

class DetailViewModel: ObservableObject {
    private let networkService: NetworkServiceProtocol
    private let router: RouterProtocol
    let comment: Comment
    
    init(networkService: NetworkServiceProtocol, router: RouterProtocol, comment: Comment) {
        self.networkService = networkService
        self.router = router
        self.comment = comment
    }
    
    func backToRoot() {
        router.popToRoot()
    }
}
