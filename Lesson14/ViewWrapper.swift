//
//  ViewWrapper.swift
//  Lesson14
//
//  Created by Сергей Дятлов on 27.07.2024.
//

import SwiftUI

struct ViewWrapper<Content: View>: Identifiable, Hashable {
    let id = UUID()
    let view: Content
    
    static func == (lhs: ViewWrapper<Content>, rhs: ViewWrapper<Content>) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
