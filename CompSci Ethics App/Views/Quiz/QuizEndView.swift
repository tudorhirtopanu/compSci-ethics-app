//
//  QuizEndView.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 01/12/2023.
//

import SwiftUI

struct QuizEndView: View {
    
    @EnvironmentObject var nm:NavigationManager
    
    var body: some View {
        VStack {
            Text("End of Quiz")
            
            Button(action: {
                nm.goBackOne()
            }, label: {
                Text("Back")
            })
        }
    }
}

#Preview {
    QuizEndView()
        .environmentObject(NavigationManager())
}
