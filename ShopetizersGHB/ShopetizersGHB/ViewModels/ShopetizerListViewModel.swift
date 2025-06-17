//
//  ShopetizerListViewModel.swift
//  ShopetizersGHB
//
//  Created by Samit Koyom on 17/6/2568 BE.
//

import SwiftUI

final class ShopetizerListViewModel: ObservableObject {
    
    // โหลด Model Shopetizer มาใช้งาน
    @Published var shopetizers: [Shopetizer] = []
    
    // สร้างตัวแปร State ไว้เก็บสถานะการ loading
    @Published var isLoading: Bool = false
    
    // สร้างตัวแปร State ไว้แสดงหน้า Detail
    @Published var isShowingDetail = false
    
    // สร้างตัวแปร State ไว้เก็บรายการที่เลือก
    @Published var selectedShopetizer: Shopetizer?
    
    // สร้าง Method ไว้อ่านข้อมูลรายการสินค้า
    func getShopetizers() {
        
        // แสดง loading
        isLoading = true
        
        NetworkManager.shared.getShopetizers { result in
            
            // เขียนส่วนการแสดงผลจาก API ไว้ใน Main Thread
            DispatchQueue.main.async { [self] in
                
                // ซ่อน loading
                self.isLoading = false
                
                switch result {
                    case .success(let shopetizers):
                    self.shopetizers = shopetizers
                    isLoading = false
                    
                    case .failure(let error):
                    switch error {
                        case .invalidResponse:
                            print("Invalid Response")
                        case .invalidURL:
                            print("Invalid URL")
                        case .invalidData:
                            print("Invalid Data")
                        case .unableToComplete:
                            print("Unable to Complete")
                        @unknown default:
                            print("Unknown Error")
                    }
                }
                
            }
        }
        
    }
}
