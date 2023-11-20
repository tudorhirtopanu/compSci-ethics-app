//
//  ContentView.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 20/11/2023.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            LearnView()
                .tabItem {
                    Label("Learn", systemImage: "graduationcap.fill")
                }
            
            QuizView()
                .tabItem {
                    Label("Quiz", systemImage: "list.dash")
                }
        }
    }
}

#Preview {
    RootView()
}
