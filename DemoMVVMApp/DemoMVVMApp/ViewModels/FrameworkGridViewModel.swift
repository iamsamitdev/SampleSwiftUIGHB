//
//  FrameworkGridView.swift
//  DemoMVVMApp
//
//  Created by Samit Koyom on 16/6/2568 BE.
//

import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @Published var isShowingDetailView = false
    @Published var isShowingListView = true
    
    var selectedFramework: Framework? {
        didSet { isShowingDetailView = true }
    }
}
