//
//  EthicVsLegalView.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 27/11/2023.
//

import SwiftUI

struct EthicVsLegalView: View {
    
    @EnvironmentObject var ethicsManager:EthicsManager
    
    var body: some View {
        
        ScrollView {
            VStack(alignment:.leading){
                
                if let data = ethicsManager.ethicsData.first?.ethicsVsLegal {
                    
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
                    
                    NavigationLink(value: EthicsChapters.professionalEthics, label: {
                        ZStack {
                            RectangleCard(color: .blue)
                                .frame(height: 40)
                                .padding(.horizontal, 5)
                            
                            Text("Next: Professional Ethics (Chapter 3)")
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
    EthicVsLegalView()
        .environmentObject(EthicsManager())
}
