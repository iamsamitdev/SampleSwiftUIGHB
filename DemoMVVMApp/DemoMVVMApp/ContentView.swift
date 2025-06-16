//
//  ContentView.swift
//  DemoMVVMApp
//
//  Created by Samit Koyom on 16/6/2568 BE.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userName = "Samit"
    @State private var userAge = 40
    @State private var message = "Welcome to SwiftUI!"
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Text("HOME")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                NavigationLink(destination: AboutView(
                    userName: userName,
                    userAge: userAge,
                    message: message
                )) {
                    Text("Go to About View")
                        .font(.headline)
                        .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
