//
//  EthicsView.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 21/11/2023.
//

import SwiftUI

struct EthicsView: View {
    
    @StateObject var ethicsManager = EthicsManager()
    
    @EnvironmentObject var navigationManager:NavigationManager
    
    var body: some View {
        
        ScrollView {
            VStack(alignment:.leading){
                
                if let data = ethicsManager.ethicsData.first?.ethicalBehaviour {
                    
                    Text(data.chapter)
                        .font(.callout)
                        .opacity(0.6)
                    
                    Text(data.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom,5)
                    
                    ForEach(data.definition, id: \.self){d in
                        Text(d)
                            .padding(.bottom, 10)
                    }
                    
                    ForEach(data.conflicts, id: \.self){c in
                        HStack {
                            Text("•")
                            Text(c)
                                .padding(.bottom, 10)
                        }
                    }
                    
                    Text(data.shortDescription)
                    
                    NavigationLink(value: EthicsChapters.ethicsVsLegal, label: {
                        ZStack {
                            RectangleCard(color: .blue)
                                .frame(height: 40)
                                .padding(.horizontal, 5)
                            
                            Text("Next: Ethical vs Legal (Chapter 2)")
                                .foregroundStyle(Color.white)
                        }
                    })
                    .padding(.top, 10)
                    
                }
                
            }.padding(.horizontal)
        }.scrollIndicators(.hidden)
            .navigationDestination(for: EthicsChapters.self) { state in
                switch state {
                case .ethicalBehaviour:
                    EthicsView()
                        .environmentObject(ethicsManager)
                case .ethicsVsLegal:
                    EthicVsLegalView()
                        .environmentObject(ethicsManager)
                case .professionalEthics:
                    ProfessionalEthicsView()
                        .environmentObject(ethicsManager)
                case .brunelEthics:
                    BrunelEthicsView()
                        .environmentObject(ethicsManager)
                        .environmentObject(navigationManager)
                }
            }
        
    }
}

#Preview {
    EthicsView()
        .environmentObject(NavigationManager())
}
