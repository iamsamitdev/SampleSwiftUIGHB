//
//  ShopetizerListView.swift
//  ShopetizersGHB
//
//  Created by Samit Koyom on 17/6/2568 BE.
//

import SwiftUI

struct ShopetizerListView: View {
    
    // โหลดตัวแปร shopetizers จาก MockData มาใช้งาน
    var shopetizers = MockData.shopetizers
    
    var body: some View {
        ZStack {
            NavigationView {
                List(shopetizers) { shopetizer in
                    ShopetizerListCell(shopetizer: shopetizer)
                        .onTapGesture {
                            print("Tap on shopetizer: \(shopetizer.name)")
                        }
                }
                .listStyle(.plain)
                .navigationTitle("🍟 Shopetizers")
            }
        }
    }
}

struct ShopetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        ShopetizerListView()
    }
}
