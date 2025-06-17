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

struct ShopetizerResponse: Decodable {
    let request: [Shopetizer]
}

struct MockData {
    static let sampleShopetizer = Shopetizer(
        id: 001,
        name: "Pancakes",
        protein: 10,
        price: 10.0,
        imageURL: "asian-flank-steak",
        carbs: 5,
        calories: 200,
        description: "This is the demo decription for Shopetizer"
    )
    
    static let shopetizers = [sampleShopetizer, sampleShopetizer, sampleShopetizer, sampleShopetizer]
}



