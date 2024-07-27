//
//  MainViewModel.swift
//  Lesson14
//
//  Created by Сергей Дятлов on 27.07.2024.
//

import SwiftUI

class MainViewModel: ObservableObject {
    private let networkService: NetworkServiceProtocol
    private let router: RouterProtocol
    
    @Published var comments: [Comment] = []
    @Published var errorMessage: String?
    
    init(networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.networkService = networkService
        self.router = router
        getComments()
    }
    
    func getComments() {
        networkService.getComments { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                switch result {
                case .success(let comments):
                    self.comments = comments
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func tapSelectedComment(comment: Comment?) {
        guard let comment = comment else { return }
        router.showDetail(comment: comment)
    }
}
