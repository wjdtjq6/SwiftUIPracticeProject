//
//  RandomImageView.swift
//  SwiftUIPracticeProject
//
//  Created by 소정섭 on 9/4/24.
//

import SwiftUI

struct RandomImageView: View {
    let url = URL(string: "https://picsum.photos/200/300?random=1")

    var body: some View {
        NavigationView {
            ScrollView {
                Text("첫번째 섹션")
                    .font(.title2).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                horizontalPosterView()
            }
            .navigationTitle("My Random Image")
            .padding()

        }
    }
    func horizontalPosterView() -> some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(0..<5) { item in
                    PosterView()
                }
            }
            //.scrollTargetLayout()
        }
        //.padding(.horizontal)
        //.scrollTargetBehavior(.paging)
        .scrollIndicators(.hidden)
    }
}
#Preview {
    RandomImageView()
}
