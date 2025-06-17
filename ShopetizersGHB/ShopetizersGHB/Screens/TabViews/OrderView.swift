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
                            ForEach(order.items) { orderItem in
                                OrderItemRow(orderItem: orderItem)
                                    .listRowSeparator(.hidden)
                            }
                            .onDelete(perform: order.deleteItems)
                        }
                        .listStyle(.plain)
                        
                        Button {
                            print("Order Placed")
                            // สามารถไป apply เพื่อส่งเข้าครัวหรืออื่น ๆ ตามต้องการ
                        } label: {
                            Text("$\(order.totalPrice, specifier: "%.2f") - Place Order")
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(Color.accentColor)
                        .controlSize(.large)
                        .padding(.bottom, 25)
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

struct OrderItemRow: View {
    @ObservedObject var orderItem: OrderItem
    @EnvironmentObject var order: OrderViewModel
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: orderItem.shopetizer.imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 75, height: 50)
                    .clipShape(Circle())
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 75, height: 50)
                    .clipShape(Circle())
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(orderItem.shopetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$\(orderItem.shopetizer.price, specifier: "%.2f") x \(orderItem.quantity)")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
                Text("รวม: $\(orderItem.totalPrice, specifier: "%.2f")")
                    .foregroundColor(.primary)
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            VStack {
                VStack(spacing: 8) {
                    Button {
                        print("Increase button tapped for \(orderItem.shopetizer.name)")
                        order.increaseQuantity(for: orderItem)
                    } label: {
                        ZStack {
                            Circle()
                                .fill(Color.green.opacity(0.1))
                                .frame(width: 36, height: 36)
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.medium)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Text("\(orderItem.quantity)")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(width: 40, height: 30)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                    
                    Button {
                        print("Decrease button tapped for \(orderItem.shopetizer.name)")
                        order.decreaseQuantity(for: orderItem)
                    } label: {
                        ZStack {
                            Circle()
                                .fill(Color.red.opacity(0.1))
                                .frame(width: 36, height: 36)
                            Image(systemName: "minus.circle.fill")
                                .foregroundColor(.red)
                                .imageScale(.medium)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
        .padding(.vertical, 5)
        .allowsHitTesting(true)
    }
}
