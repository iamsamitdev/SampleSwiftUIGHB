//
//  OrderViewModel.swift
//  ShopetizersGHB
//
//  Created by Samit Koyom on 17/6/2568 BE.
//

import SwiftUI
import Combine

final class OrderViewModel: ObservableObject {
    
    @Published var items: [OrderItem] = []
    private var cancellables = Set<AnyCancellable>()
    
    // สร้างฟังก์ชันเพิ่มสินค้าเข้าหน้า order
    func add(_ shopetizer: Shopetizer) {
        // ตรวจสอบว่ามีสินค้าชิ้นนี้ในรายการแล้วหรือไม่
        if let existingItem = items.first(where: { $0.shopetizer.id == shopetizer.id }) {
            // ถ้ามีแล้ว เพิ่มจำนวน
            existingItem.quantity += 1
        } else {
            // ถ้ายังไม่มี เพิ่มรายการใหม่
            let newItem = OrderItem(shopetizer: shopetizer, quantity: 1)
            items.append(newItem)
            
            // Subscribe ให้ OrderItem แจ้งเตือนเมื่อมีการเปลี่ยนแปลง
            newItem.objectWillChange
                .sink { [weak self] _ in
                    self?.objectWillChange.send()
                }
                .store(in: &cancellables)
        }
    }
    
    // สร้างฟังก์ชันรวมยอดในหน้า order
    var totalPrice: Double {
        items.reduce(0) { total, item in
            total + item.totalPrice
        }
    }
    
    // สร้างฟังก์ชันการลบสินค้า
    func deleteItems(at atOffsets: IndexSet) {
        items.remove(atOffsets: atOffsets)
    }
    
    // สร้างฟังก์ชันเพิ่มจำนวนสินค้า
    func increaseQuantity(for item: OrderItem) {
        item.quantity += 1
    }
    
    // สร้างฟังก์ชันลดจำนวนสินค้า
    func decreaseQuantity(for item: OrderItem) {
        if item.quantity > 1 {
            item.quantity -= 1
        } else {
            // ถ้าจำนวนเหลือ 1 และกดลด ให้ลบรายการออก
            if let index = items.firstIndex(where: { $0.id == item.id }) {
                items.remove(at: index)
            }
        }
    }
}
