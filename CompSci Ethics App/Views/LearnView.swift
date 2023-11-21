//
//  LearnView.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 20/11/2023.
//

import SwiftUI

enum LearningDestinations {
    case ethics
    case legal
    case intellectualProperty
}

struct LearnView: View {
    var body: some View {
        VStack{
            
            NavigationLink(value: LearningDestinations.ethics, label: {
                Text("Ethics")
            })
            
            NavigationLink(value: LearningDestinations.legal, label: {
                Text("Legal Issues")
            })
            
            NavigationLink(value: LearningDestinations.intellectualProperty, label: {
                Text("Intellectual Property")
            })
            
            .navigationDestination(for: LearningDestinations.self) { state in
                switch state {
                    
                case .ethics:
                    EthicsView()
                case .legal:
                    LegalView()
                case .intellectualProperty:
                    IntellectualPropertyView()
                    
                }
            }
            
        }
    }
}

#Preview {
    LearnView()
}
