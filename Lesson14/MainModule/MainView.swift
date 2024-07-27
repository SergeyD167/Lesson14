//
//  MainView.swift
//  Lesson14
//
//  Created by Сергей Дятлов on 27.07.2024.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        VStack {
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            } else {
                List(viewModel.comments) { comment in
                    VStack(alignment: .leading) {
                        Text(comment.name)
                            .font(.headline)
                        Text(comment.body)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .onTapGesture {
                        viewModel.tapSelectedComment(comment: comment)
                    }
                }
            }
            Button("Refresh Comments") {
                viewModel.getComments()
            }
        }
        .onAppear {
            viewModel.getComments()
        }
    }
}
