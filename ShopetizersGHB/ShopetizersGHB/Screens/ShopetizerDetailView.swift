//
//  ShopetizerDetailView.swift
//  ShopetizersGHB
//
//  Created by Samit Koyom on 17/6/2568 BE.
//

import SwiftUI

struct ShopetizerDetailView: View {
    
    // โหลด Model
    let shopetizer: Shopetizer
    
    // Binding isShowingDetail
    @Binding var isShowingDetail: Bool
    
    // การเรียกใช้งานตัวแปร environmentObject
    @EnvironmentObject var orders: OrderViewModel
    
    var body: some View {
        VStack {
//            Image(shopetizer.imageURL)
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: 300, height: 225)
            
            AsyncImage(url: URL(string: shopetizer.imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 225)
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 225)
            }
            
            VStack {
                Text(shopetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(shopetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                HStack (spacing: 40) {
                    
                    NutritionInfo(title: "Calories", value: shopetizer.calories)
                    NutritionInfo(title: "Carbs", value: shopetizer.carbs)
                    NutritionInfo(title: "Protin", value: shopetizer.protein)
                    
                }
            }
            
            Spacer()
            
            Button {
                // print("Added order")
                orders.add(shopetizer)
                print("totalPrice \(orders.totalPrice)")
                isShowingDetail = false // ซ่อนหน้าต่างสินค้า
            } label: {
                Text("$\(shopetizer.price, specifier: "%.2f") - Add to Order")
            }
            .buttonStyle(.borderedProminent)
            .tint(Color.accentColor)
            .controlSize(.large)
            .padding(.bottom, 30)
            
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        
        .overlay(Button {
            // print("Close")
            isShowingDetail = false
        } label: {
            ZStack {
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .opacity(0.6)
                Image(systemName: "xmark")
                    .imageScale(.small)
                    .frame(width: 44, height: 44)
                    .foregroundColor(.black)
            }
        }, alignment: .topTrailing)
                 
    }
}

struct NutritionInfo: View {
    
    let title: String
    let value: Int
    
    var body: some View {
        VStack (spacing: 5){
            Text(title)
                .bold()
                .font(.caption)
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

struct ShopetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ShopetizerDetailView(
            shopetizer: MockData.sampleShopetizer,
            isShowingDetail: .constant(true))
        .environmentObject(OrderViewModel())
    }
}
