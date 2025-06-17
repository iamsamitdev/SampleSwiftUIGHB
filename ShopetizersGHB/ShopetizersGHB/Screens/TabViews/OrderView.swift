//
//  OrderView.swift
//  ShopetizersGHB
//
//  Created by Samit Koyom on 17/6/2568 BE.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: OrderViewModel
    
    var body: some View {
        NavigationView {
            
            // ถ้ามี order เข้ามาให้แสดงผล
            if !order.items.isEmpty {
                
                ZStack {
                    VStack {
                        List {
                            ForEach(order.items) { Shopetizer in
                                ShopetizerListCell(shopetizer: Shopetizer)
                                    .listRowSeparator(.hidden)
                            }
                        }
                        .listStyle(.plain)
                    }
                }
                
            }
            
            // เช็คว่าถ้าไม่มีรายการในหน้านี้
            if order.items.isEmpty {
                ZStack {
                    VStack {
                        Image("empty-order")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                        Text("ยังไม่มีรายการสินค้า \nกรุณาไปสั่งรายการสินค้าก่อน")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.secondary)
                            .padding()
                    }
                    .offset(y: -50)
                    .navigationTitle("🧾 Orders")
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct OrderView_Previews: PreviewProvider {
    
    static var previews: some View {
        OrderView().environmentObject(OrderViewModel())
    }
}
