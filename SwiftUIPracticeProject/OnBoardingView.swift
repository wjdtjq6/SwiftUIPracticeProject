//
//  ContentView.swift
//  SwiftUIPracticeProject
//
//  Created by 소정섭 on 9/2/24.
//

import SwiftUI

struct OnBoardingView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("HELLO.")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading,30)

                Text("MYPOLAROID")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading,30)
                Image("launchImg")
                    .padding()
                NavigationLink {
                    SettingView()
                } label: {
                    Text("시작하기")
                        .foregroundStyle(.white)
                        .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
                .background(.blue)
                .clipShape(.capsule)
            }
            .padding()
        }
    }
}

#Preview {
    OnBoardingView()
}
