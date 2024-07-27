//
//  NetworkService.swift
//  Lesson14
//
//  Created by Сергей Дятлов on 27.07.2024.
//

import SwiftUI

protocol NetworkServiceProtocol {
    func getComments(completion: @escaping (Result<[Comment], Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func getComments(completion: @escaping (Result<[Comment], Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let comments = try JSONDecoder().decode([Comment].self, from: data)
                completion(.success(comments))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
