//
//  ContentView.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 20/11/2023.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        NavigationStack {
            TabView {
                LearnView()
                    .tabItem {
                        Label("Learn", systemImage: "book.fill")
                    }
                
                QuizView()
                    .tabItem {
                        Label("Quiz", systemImage: "graduationcap.fill")
                    }
            }
        }
        .environmentObject(IntellectualPropertyManager())
    }
}

#Preview {
    RootView()
}
