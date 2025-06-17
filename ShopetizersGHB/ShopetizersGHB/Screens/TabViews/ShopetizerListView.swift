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
                            print("Tapped on \(shopetizer.name)")
                            viewModel.selectedShopetizer = shopetizer
                            viewModel.isShowingDetail = true
                        }
                }
                .listStyle(.plain)
                .navigationTitle("🍟 Shopetizers")
            }
            .navigationViewStyle(.stack)
            .onAppear {
                viewModel.getShopetizers()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            // แสดง loading หากยังโหลดข้อมูลไม่เสร็จ
            if viewModel.isLoading {
                LoadingView(loadingTitle: "กำลังโหลดรายการสินค้า...")
            }
            
            // แสดงหน้า detail เป็น popup
            if viewModel.isShowingDetail, let selectedShopetizer = viewModel.selectedShopetizer {
                ShopetizerDetailView(
                    shopetizer: selectedShopetizer,
                    isShowingDetail: $viewModel.isShowingDetail)
            }
        }
    }
}

struct ShopetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        ShopetizerListView()
            .environmentObject(OrderViewModel())
    }
}
