//
//  ProfessionalEthicsView.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 27/11/2023.
//

import SwiftUI

struct ProfessionalEthicsView: View {
    
    @EnvironmentObject var ethicsManager:EthicsManager
    
    var body: some View {
        
        ScrollView {
            VStack(alignment:.leading){
                
                if let data = ethicsManager.ethicsData.first?.professionalEthics {
                    
                    Text(data.chapter)
                        .font(.callout)
                        .opacity(0.6)
                    
                    Text(data.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom,5)
                    
                    ForEach(data.description, id: \.self){d in
                        Text(d)
                            .padding(.bottom, 10)
                    }
                    
                    ForEach(data.codeOfConductSections){c in
                        
                        HStack {
                            Text(String(c.id + 1)+".")
                                .font(.headline)
                            Text(c.title)
                                .font(.headline)
                        }
                        
                        Text(c.subtitle)
                            .fontWeight(.medium)
                            .padding(.bottom, 2)
                            .italic()
                        
                        Text(c.description)
                            .padding(.bottom, 2)
                        
                    }
                    
                    NavigationLink(value: EthicsChapters.brunelEthics, label: {
                        ZStack {
                            RectangleCard(color: .blue)
                                .frame(height: 40)
                                .padding(.horizontal, 5)
                            
                            Text("Next: Brunel Ethics (Chapter 4)")
                                .foregroundStyle(Color.white)
                        }
                    })
                    .padding(.top, 10)
                    
                }
            }.padding(.horizontal)
        }.scrollIndicators(.hidden)
        
    }
}

#Preview {
    ProfessionalEthicsView()
        .environmentObject(EthicsManager())
}
