//
//  PosterView.swift
//  SwiftUIPracticeProject
//
//  Created by 소정섭 on 9/4/24.
//

import SwiftUI

struct PosterView: View {
    let url = URL(string: "https://picsum.photos/200/300?random=1")

    var body: some View {
        AsyncImage(url: url) {data in
            switch data {
            case .empty:
                ProgressView()
                    .frame(width: 100, height: 200)
            case .success(let image):
                AsyncImage(url: url){ image in
                    image.image?
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(25)
                        .frame(width: 100, height: 200)
                }
                .frame(width: 100, height: 200)
            case .failure(let error):
                Image(systemName: "pencil")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            @unknown default:
                fatalError()
            }
        }
    }
}

#Preview {
    PosterView()
}
