//
//  User.swift
//  CollectionViewKadai
//
//  Created by sakiyamaK on 2024/09/11.
//

import Foundation

struct User: Codable {
    
    struct Id: Codable {
        let name: String?
        let value: String?
    }
    struct Picture: Codable {
        let thumbnail: String?
    }
    
    let id: Id
    let picture: Picture    
}

