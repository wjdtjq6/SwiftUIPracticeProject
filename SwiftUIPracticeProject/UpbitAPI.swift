//
//  UpbitAPI.swift
//  SwiftUIPracticeProject
//
//  Created by 소정섭 on 9/3/24.
//

import Foundation

struct Market: Hashable, Codable {
    let market, koreanName, englishName: String

    enum CodingKeys: String, CodingKey {
        case market
        case koreanName = "korean_name"
        case englishName = "english_name"
    }
}

struct UpbitAPI {
    
    private init() { }
    static func fetchMArket() async throws -> [Market] {
        let url = URL(string: "https://api.upbit.com/v1/market/all")!
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        let decodedData = try JSONDecoder().decode([Market].self, from: data)
        
        return decodedData
    }
    static func fetchAllMarket(completion: @escaping ([Market]) -> Void) {
        
        let url = URL(string: "https://api.upbit.com/v1/market/all")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let decodedData = try JSONDecoder().decode([Market].self, from: data)
                DispatchQueue.main.async {
                    completion(decodedData)
                    print(decodedData)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
