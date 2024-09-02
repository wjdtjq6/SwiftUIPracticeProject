//
//  SettingView.swift
//  SwiftUIPracticeProject
//
//  Created by 소정섭 on 9/2/24.
//

import SwiftUI

struct SettingView: View {
    @State private var nick = ""
    @State private var mbtiSelections = ["", "", "", ""]

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
            VStack {
                TextField("닉네임을 입력해주세요 :)", text: $nick)
                    .frame(maxWidth: .infinity, alignment: .center)
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 1.0, alignment: .bottom)
                    .foregroundColor(Color.gray)
            }
            .padding(.vertical, 40)
                
            HStack {
                VStack {
                    Text("MBTI")
                        .bold()
                        .frame(alignment: .top)
                        .offset(y: -40)
                }
                Spacer()
                VStack {
                    HStack {
                        mbtiButton(mbti: "E", index: 0)
                        mbtiButton(mbti: "S", index: 1)
                        mbtiButton(mbti: "T", index: 2)
                        mbtiButton(mbti: "J", index: 3)
                    }
                    HStack {
                        mbtiButton(mbti: "I", index: 0)
                        mbtiButton(mbti: "N", index: 1)
                        mbtiButton(mbti: "F", index: 2)
                        mbtiButton(mbti: "P", index: 3)
                    }
                }
            }
            Spacer()
            NavigationLink {
                MainView()
            } label: {
                Text("완료")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity,maxHeight: 50, alignment: .center)
                    .background(.blue)
                    .clipShape(.capsule)

            }

        }
        .padding(30)
        .navigationTitle("PROFILE SETTING")

    }
    func mbtiButton(mbti: String,index: Int) -> some View {
        Button(action: {
            if mbtiSelections[index] == mbti {
                    mbtiSelections[index] = ""
                } else {
                    mbtiSelections[index] = mbti
                }
            print(mbtiSelections[index])
        }, label: {
            Text("\(mbti)")
                .frame(width: 50, height: 50, alignment: .center)
                .font(.title2)
                .foregroundColor(mbtiSelections[index] == mbti ? .blue : .gray)
                .overlay(
                    Circle()
                        .stroke(mbtiSelections[index] == mbti ? Color.blue : .gray, lineWidth: 1.5)
                )
        })
    }
}


#Preview {
    SettingView()
}
