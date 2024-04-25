//
//  MenuItem.swift
//  Little Lemon
//
//  Created by Ayo Shafau on 4/20/24.
//

import Foundation

struct MenuItem: Codable, Identifiable {
    let id = UUID()
    let title: String
    let image: String
    let price: String
    
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case image = "image"
        case price = "price"
        
    }
    
}
