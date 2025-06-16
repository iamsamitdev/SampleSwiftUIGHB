//
//  Main.swift
//  DemoMVVMApp
//
//  Created by Samit Koyom on 16/6/2568 BE.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        TabView {
            FrameworkGridView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Grid")
                }
            FrameworkListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("List")
                }
        }
    }
}

#Preview {
    MainView()
}
