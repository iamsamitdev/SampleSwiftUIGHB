//
//  OrderViewModel.swift
//  ShopetizersGHB
//
//  Created by Samit Koyom on 17/6/2568 BE.
//

import SwiftUI

final class OrderViewModel: ObservableObject {
    
    @Published var items: [Shopetizer] = []
    
    // สร้างฟังก์ชันเพิ่มสินค้าเข้าหน้า order
    func add(_ shopitizer: Shopetizer){
        items.append(shopitizer)
    }
    
    // สร้างฟังก์ชันรวมยอดในหน้า order
    var totalPrice: Double {
        items.reduce(0) {
            $0 + $1.price
        }
    }
    
    // สร้างฟังก์ชันการลบสินค้า
    func deleteItems(at atOffsets: IndexSet){
        items.remove(atOffsets: atOffsets)
    }
}
