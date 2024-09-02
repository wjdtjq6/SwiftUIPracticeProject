//
//  ProfileView.swift
//  SwiftUIPracticeProject
//
//  Created by 소정섭 on 9/2/24.
//

import SwiftUI

struct ProfileView: View {
    let columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 4)
    @State private var selectedProfile = 7 // 초기 선택된 프로필 인덱스

    var body: some View {
        VStack {
            NavigationLink {
                ProfileView()
            } label: {
                Image("profile_0")
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .clipShape(.circle)
                    .overlay(
                        Circle()
                            .stroke(Color.blue, lineWidth: 5)
                    )
                    .overlay(alignment: .bottomTrailing) {
                        Image(systemName: "camera.fill")
                            .resizable()
                            .frame(width: 12, height: 12, alignment: .center)
                            .foregroundColor(.white)
                            .padding(6)
                            .background(.blue)
                            .clipShape(.circle)
                    }
            }
            .padding(30)
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(0..<12) { index in
                    NavigationLink(destination: Text("프로필 설정: \(index)")) {
                        Image("profile_\(index)")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(index == selectedProfile ? Color.blue : Color.gray.opacity(0.3), lineWidth: 2)
                            )
                    }
                }
            }
            .padding()
            Spacer()
                .navigationTitle("PROFILE SETTING")

        }
    }
}

#Preview {
    ProfileView()
}
