//
//  Shopetizer.swift
//  ShopetizersGHB
//
//  Created by Samit Koyom on 17/6/2568 BE.
//

import Foundation

struct Shopetizer: Decodable, Identifiable {
    
    let id: Int
    let name: String
    let protein: Int
    let price: Double
    let imageURL: String
    let carbs: Int
    let calories : Int
    let description: String
    
}
