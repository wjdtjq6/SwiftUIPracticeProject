//
//  DetailView.swift
//  SwiftUIPracticeProject
//
//  Created by 소정섭 on 9/5/24.
//

import SwiftUI

struct DetailView: View {
    let image: Image
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(25)
            .frame(width: 100, height: 150)
            .padding(.horizontal)
            .frame(width: 100, height: 200)
        
    }
}

//#Preview {
//    DetailView(image: Image(systemName: "star.fill"), text: "김치")
//}
