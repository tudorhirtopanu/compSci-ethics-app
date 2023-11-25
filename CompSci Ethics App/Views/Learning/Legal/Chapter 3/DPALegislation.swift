//
//  DPALegislation.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 25/11/2023.
//

import SwiftUI

struct DPALegislation: View {
    
    @EnvironmentObject var legalManager:LegalManager
    
    var body: some View {
        ScrollView {
            VStack(alignment:.leading){
                if let data = legalManager.legalData.first?.dataProtectionLegislation{
                    
                    Text(data.chapter)
                        .font(.callout)
                        .opacity(0.6)
                    
                    Text(data.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.bottom,5)
                    
                    ForEach(data.description, id:\.self){d in
                        
                        HStack {
                            Text("•")
                            Text(d)
                        }
                        .padding(.bottom, 2)
                        
                    }
                    
                    NavigationLink(value: LegalChapters.dpa, label: {
                        ZStack {
                            RectangleCard(color: .blue)
                                .frame(height: 40)
                                .padding(.horizontal, 5)
                            
                            Text("Next: DPA (Chapter 3.2)")
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
    DPALegislation()
        .environmentObject(LegalManager())
}
