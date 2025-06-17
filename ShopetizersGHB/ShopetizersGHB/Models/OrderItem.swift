//
//  OrderItem.swift
//  ShopetizersGHB
//
//  Created by Samit Koyom on 17/6/2568 BE.
//

import Foundation
import Combine

class OrderItem: Identifiable, ObservableObject {
    let id = UUID()
    let shopetizer: Shopetizer
    @Published var quantity: Int
    
    init(shopetizer: Shopetizer, quantity: Int) {
        self.shopetizer = shopetizer
        self.quantity = quantity
    }
    
    var totalPrice: Double {
        return shopetizer.price * Double(quantity)
    }
}
