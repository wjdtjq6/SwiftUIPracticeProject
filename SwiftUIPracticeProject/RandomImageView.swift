//
//  RandomImageView.swift
//  SwiftUIPracticeProject
//
//  Created by 소정섭 on 9/4/24.
//

import SwiftUI

struct RandomImageView: View {
    let url = URL(string: "https://picsum.photos/200/300?random=1")
    let sections = [
        "첫번째 섹션",
        "두번째 섹션",
        "세번째 섹션",
        "네번째 섹션",
        "다섯번째 섹션",

    ]
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(sections, id: \.self) { item in
                    section(text: item)
                }
            }
            .navigationTitle("My Random Image")
        }
    }
    func horizontalPosterView() -> some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(0..<5) { item in
                    PosterView()
                }
            }
            .padding(.horizontal)
            .frame(height: 150)
        }
        .scrollIndicators(.hidden)
    }
    func section(text: String) -> some View {
        VStack {
            Text(text)
                .font(.title2).bold()
                .padding(.top)
                .padding(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            horizontalPosterView()
        }
    }
}
#Preview {
    RandomImageView()
}
