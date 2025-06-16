//
//  FrameworkDetailView.swift
//  DemoMVVMApp
//
//  Created by Samit Koyom on 16/6/2568 BE.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    var framework: Framework
    
    @Binding var isShowingDetailView: Bool
    @Binding var isShowingListView: Bool
    
    var body: some View {
        VStack {
            
            HStack {
                
                Spacer()
                
                if isShowingListView {
                    Button {
                        isShowingDetailView = false
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(Color(.label))
                            .imageScale(.large)
                            .frame(width: 44, height: 44)
                    }
                }
            }
            .padding()
                
            Spacer()
            
            Image(framework.imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            }
        }
    }


struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(
            framework: MockData.frameworks[0],
            isShowingDetailView: .constant(false),
            isShowingListView: .constant(false)
        )
    }
}
