//
//  PosterView.swift
//  SwiftUIPracticeProject
//
//  Created by 소정섭 on 9/4/24.
//

import SwiftUI

struct PosterView: View {
    let url: URL?//(string: "https://picsum.photos/200/300?random=1")
    @Binding var title: String
    
    var body: some View {
        AsyncImage(url: url) {data in
            switch data {
            case .empty:
                ProgressView()
                    .frame(width: 100, height: 150)
            case .success(let image):
                NavigationLink {
                    DetailView(image: image)
                    TextField("섹션 제목", text: $title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                } label: {
                    DetailView(image: image)
                }
            case .failure(let error):
                Image(systemName: "photo")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            @unknown default:
                fatalError()
            }
        }
    }
}

//#Preview {
//    PosterView(url: URL(string: "https://picsum.photos/200/300?random=1"), title: "")
//}
