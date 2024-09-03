//
//  SearchView.swift
//  SwiftUIPracticeProject
//
//  Created by 소정섭 on 9/3/24.
//

import SwiftUI

struct SearchView: View {
        @State private var searchText = ""
        @State private var market: [Market] = []
        var randomMarket: Market = Market(market: "", koreanName: "", englishName: "")
    var filterMarket: [Market] {
        return searchText.isEmpty ? market : market.filter({ $0.englishName .contains(searchText) || $0.koreanName.contains(searchText) ||
            $0.market.contains(searchText) || $0.hashValue.description.contains(searchText)
        })
    }
            var body: some View {
                NavigationStack {
                    ScrollView {
                        listView()
                    }
                    .navigationTitle("Search")
                    .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
                    .padding(.horizontal, 20)
                }

                .task {
                    do {
                        let Result = try await UpbitAPI.fetchMArket()
                        market = Result
                    } catch {
                        print("error")
                    }
                }
            }
    
    func listView() -> some View {
        LazyVStack{
            ForEach(filterMarket.indices, id: \.self) { index in
                rowView(filterMarket[index], index: index + 1)
            }
        }
    }
    
    func rowView(_ item: Market, index: Int) -> some View {
        HStack {
            Image(systemName: "\(index).circle")
                .padding(5)
            VStack(alignment: .leading, content: {
                Text(item.koreanName)
                    .fontWeight(.medium)
                Text(item.englishName)
                    .font(.caption)
                    .foregroundStyle(.gray)
            })
            Spacer()
            Text(item.market)
            Button(action: {
                print("click")
            }, label: {
                Image(systemName: "star.fill")
                    .foregroundColor(.black)
            })

        }
        //.padding(.horizontal, 20)
        .padding(.vertical, 6)
    }
}

#Preview {
    SearchView()
}
