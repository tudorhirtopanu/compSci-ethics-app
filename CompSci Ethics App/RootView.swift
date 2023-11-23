//
//  ContentView.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 20/11/2023.
//

import SwiftUI

struct RootView: View {
    
    @StateObject var navigationManager = NavigationManager()
    
    var body: some View {
        NavigationStack(path:$navigationManager.path) {
            TabView {
                LearnView()
                    .environmentObject(navigationManager)
                    .tabItem {
                        Label("Learn", systemImage: "book.fill")
                    }
                
                QuizView()
                    .environmentObject(navigationManager)
                    .tabItem {
                        Label("Quiz", systemImage: "graduationcap.fill")
                    }
            }
        }
    }
}

#Preview {
    RootView()
}
