//
//  RandomImageView.swift
//  SwiftUIPracticeProject
//
//  Created by 소정섭 on 9/4/24.
//

import SwiftUI

struct Section: Identifiable {
    let id = UUID()
    var title: String
}

struct RandomImageView: View {
    @State private var sections = [
           Section(title: "첫번째 섹션"),
           Section(title: "두번째 섹션"),
           Section(title: "세번째 섹션"),
           Section(title: "네번째 섹션"),
           Section(title: "다섯번째 섹션"),
       ]
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach($sections, id: \.id) { $item in
                    section(section: $item)
                }
            }
            .navigationTitle("My Random Image")
        }
    }
    func horizontalPosterView(_ sectionBinding: Binding<Section>) -> some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(0..<5) { index in
                    let imageId = Int.random(in: 0...500)
                    let url = URL(string: "https://picsum.photos/id/\(imageId)/200/300")
                    NavigationLink {
                        PosterView(url: url, title: sectionBinding.title)
                        //Text(text)
                    } label: {
                        PosterView(url: url, title: sectionBinding.title)
                    }
                }
            }
            .padding(.horizontal)
            .frame(height: 150)
        }      
        .scrollIndicators(.hidden)
    }
    func section(section: Binding<Section>) -> some View {
            VStack {
                TextField("섹션 제목", text: section.title)
                    .font(.title2).bold()
                    .padding(.top)
                    .padding(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                horizontalPosterView(section)
            }
        }
}
#Preview {
    RandomImageView()
}
