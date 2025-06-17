//
//  ContentView.swift
//  ShopetizersGHB
//
//  Created by Samit Koyom on 17/6/2568 BE.
//

import SwiftUI

struct ShopetizerTabView: View {
    var body: some View {
        TabView {
            ShopetizerListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            OrderView()
                .tabItem {
                    Label("Orders", systemImage: "bag")
                }
            AccountView()
                .tabItem {
                    Label("Person", systemImage: "person")
                }
        }
    }
}

#Preview {
    ShopetizerTabView()
        .environmentObject(OrderViewModel())
}
