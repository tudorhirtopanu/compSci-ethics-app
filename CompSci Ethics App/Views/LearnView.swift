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

enum IntellectualPropertyChapters {
    case introduction
    case copyright
    case patents
}

enum LegalChapters {
    
    //Chapter 1
    case computerSoftwareCrime
    
    //Chapter 2
    case computerMisuseAct
    case cmaAmendments
    
    // Chapter 3
    case privacy
    case dpaLegislation
    case dpa
    case gdpr
    
    // Chapter 4
    case dataSecurity
    case securityThreats
    case reducingRisks
    case staySafe
   
}

enum EthicsChapters {
    
    case ethicalBehaviour
    case ethicsVsLegal
    case professionalEthics
    case brunelEthics
    
}

struct LearnView: View {
    
    @EnvironmentObject var navigationManager:NavigationManager
    
    var body: some View {
        VStack{

                NavigationLink(value: LearningDestinations.ethics, label: {
                    ZStack{
                        RectangleCard(color: .cyan)
                            .frame(height: 60)
                        Text("Ethics")
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundStyle(Color.white)
                    }
                })
                
                NavigationLink(value: LearningDestinations.legal, label: {
                    ZStack{
                        RectangleCard(color: .indigo)
                            .frame(height: 60)
                        Text("Legal Issues")
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundStyle(Color.white)
                    }
                })
            

                NavigationLink(value: LearningDestinations.intellectualProperty, label: {
                    ZStack{
                        RectangleCard(color: .blue)
                            .frame(height: 60)
                        Text("Intellectual Property")
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundStyle(Color.white)
                    }
                })
            
            .navigationDestination(for: LearningDestinations.self) { state in
                switch state {
                    
                case .ethics:
                    EthicsView()
                        .environmentObject(navigationManager)
                case .legal:
                    LegalView()
                        .environmentObject(navigationManager)
                case .intellectualProperty:
                    IntellectualPropertyView()
                        .environmentObject(navigationManager)
                    
                }
            }
            
            
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    NavigationStack {
        LearnView()
    }
}
