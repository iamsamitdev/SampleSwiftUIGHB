//
//  AboutView.swift
//  DemoMVVMApp
//
//  Created by Samit Koyom on 16/6/2568 BE.
//

import SwiftUI

struct AboutView: View {
    
    let userName: String
    let userAge: Int
    let message: String
    
    var body: some View {
        VStack(spacing: 20){
            Text("This is About View")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Hello, \(userName)! You are \(userAge) years old.")
            Text(message)
        }
    }
}

#Preview {
    AboutView(userName: "useranme", userAge: 0, message: "message")
}
