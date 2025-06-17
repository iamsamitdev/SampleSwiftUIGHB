//
//  ShopetizersGHBApp.swift
//  ShopetizersGHB
//
//  Created by Samit Koyom on 17/6/2568 BE.
//

import SwiftUI

@main
struct ShopetizersGHBApp: App {
    
    var orders = OrderViewModel()
    
    var body: some Scene {
        WindowGroup {
            ShopetizerTabView()
                .environmentObject(orders)
        }
    }
}
