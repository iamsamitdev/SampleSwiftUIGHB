//
//  ShopetizerListView.swift
//  ShopetizersGHB
//
//  Created by Samit Koyom on 17/6/2568 BE.
//

import SwiftUI

struct ShopetizerListView: View {
    
    // โหลดตัวแปร shopetizers จาก ViewModel มาใช้งาน
    @StateObject var viewModel = ShopetizerListViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.shopetizers) { shopetizer in
                    ShopetizerListCell(shopetizer: shopetizer)
                        .onTapGesture {
                            print("Tap on shopetizer: \(shopetizer.name)")
                        }
                }
                .listStyle(.plain)
                .navigationTitle("🍟 Shopetizers")
            }
            .navigationViewStyle(.stack)
            .onAppear {
                viewModel.getShopetizers()
            }
            
            // แสดง loading หากยังโหลดข้อมูลไม่เสร็จ
            if viewModel.isLoading {
                LoadingView(loadingTitle: "กำลังโหลดรายการสินค้า...")
            }
        }
    }
}

struct ShopetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        ShopetizerListView()
    }
}
