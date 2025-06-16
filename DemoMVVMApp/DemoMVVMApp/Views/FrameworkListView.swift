//
//  FrameworkListView.swift
//  DemoMVVMApp
//
//  Created by Samit Koyom on 16/6/2568 BE.
//

import SwiftUI

struct FrameworkListView: View {
    
    // เรียกใช้งาน class FramewokrGridview
    @StateObject var viewModel = FrameworkListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(MockData.frameworks, id: \.name) { framework in
                    NavigationLink(
                        destination: FrameworkDetailView(
                            framework: framework,
                            isShowingDetailView: $viewModel.isShowingDetailView,
                            isShowingListView: $viewModel.isShowingListView
                        )
                    ){
                        HStack {
                            Image(framework.imageName)
                                .resizable()
                                .frame(width: 70, height: 70)
                            Text(framework.name)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .scaledToFit()
                                .padding()
                        }
                    }
                }
                .listStyle(.plain)
                .navigationTitle(Text("🍎 Frameworks"))
                
            }
            .navigationViewStyle(.stack)
        }
    }
}

#Preview {
    FrameworkListView()
}
