//
//  DetailView.swift
//  Lesson14
//
//  Created by Сергей Дятлов on 27.07.2024.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: DetailViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.comment.name)
                .font(.title)
                .padding()
            Text(viewModel.comment.email)
                .font(.subheadline)
                .padding()
            Text(viewModel.comment.body)
                .font(.body)
                .padding()
            Button("Back to Root") {
                viewModel.backToRoot()
            }
        }
        .navigationBarBackButtonHidden()
        .padding()
    }
}
