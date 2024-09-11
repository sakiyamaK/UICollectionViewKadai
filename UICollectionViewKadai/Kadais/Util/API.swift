//
//  API.swift
//  CollectionViewKadai
//
//  Created by sakiyamaK on 2024/09/11.
//

import Foundation

struct APIResult: Codable {
    var results: [User]
}

struct API {
    private init() {}
    static let shared = API()
    
    func getUsers() async throws -> [User] {
        let urlStr = "https://randomuser.me/api/?page=0&results=30&seed=abc"
        let url = URL(string: urlStr)!
        let urlRequest = URLRequest(url: url)
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let result = try JSONDecoder().decode(APIResult.self, from: data)
            return result.results
        }
        catch let e {
            print(e)
            throw e
        }
    }
    
    func getDummyUsers() -> [User] {
        API.loadJson(from: "dummy_users")
    }

    private static func loadJson(from fileName: String) -> [User] {
        let path = Bundle.main.path(forResource: fileName, ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        let result = try! JSONDecoder().decode(APIResult.self, from: data)
        return result.results
    }
}
