//
//  FrameworkGridView.swift
//  DemoMVVMApp
//
//  Created by Samit Koyom on 16/6/2568 BE.
//

import SwiftUI

struct FrameworkGridView: View {
    
    // เรียกใช้งาน class FramewokrGridview
    @StateObject var viewModel = FrameworkGridViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(MockData.frameworks, id: \.name) { framework in
                        VStack {
                            Image(framework.imageName)
                                .resizable()
                                .frame(width: 90, height: 90)
                            
                            Text(framework.name)
                        }
                        .padding()
                        .onTapGesture {
                            viewModel.selectedFramework = framework
                        }
                    }
                }
            }
            .navigationTitle("📱 Frameworks")
            .sheet(isPresented: $viewModel.isShowingDetailView){
                FrameworkDetailView()
            }
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    FrameworkGridView()
}
