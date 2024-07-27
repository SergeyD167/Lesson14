//
//  Comment.swift
//  Lesson14
//
//  Created by Сергей Дятлов on 27.07.2024.
//

import Foundation

struct Comment: Identifiable, Decodable, Hashable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
