//
//  ShopetizerListCell.swift
//  ShopetizersGHB
//
//  Created by Samit Koyom on 17/6/2568 BE.
//

import SwiftUI

struct ShopetizerListCell: View {
    
    let shopetizer: Shopetizer
    
    var body: some View {
        HStack {
            Image(shopetizer.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
            VStack (alignment: .leading, spacing: 5) {
                Text(shopetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$\(shopetizer.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding()
        }
    }
}

struct ShopetizerListCell_Previews: PreviewProvider {
    static var previews: some View {
        ShopetizerListCell(shopetizer: MockData.sampleShopetizer)
    }
}
