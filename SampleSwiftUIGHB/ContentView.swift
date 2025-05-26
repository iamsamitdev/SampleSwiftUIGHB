//
//  ContentView.swift
//  SampleSwiftUIGHB
//
//  Created by Samit Koyom on 26/5/2568 BE.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Welcome to SwiftUI!")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
