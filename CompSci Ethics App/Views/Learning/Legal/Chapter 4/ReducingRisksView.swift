//
//  ReducingRisksView.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 25/11/2023.
//

import SwiftUI

struct ReducingRisksView: View {
    
    @EnvironmentObject var legalManager:LegalManager
    
    var body: some View {
        
        ScrollView {
            VStack(alignment:.leading){
                if let data = legalManager.legalData.first?.reducingRisks{
                    
                    Text(data.chapter)
                        .font(.callout)
                        .opacity(0.6)
                    
                    Text(data.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.bottom,5)
                    
                    ForEach(data.riskReduction){r in
                        HStack {
                            Text(String(r.id + 1)+".")
                                .font(.headline)
                                .padding(.bottom, 5)
                            
                            Text(r.name)
                                .font(.headline)
                                .padding(.bottom, 5)
                        }
                        
                        ForEach(r.description, id:\.self){d in
                            HStack {
                                Text("•")
                                Text(d)
                            }
                            .padding(.bottom, 2)
                        }
                        
                        if let info = r.extraInfo {
                            ForEach(info, id:\.self){i in
                                Text(i)
                                    .padding(.bottom, 2)
                            }
                        }
                        
                    }
                    
                    NavigationLink(value: LegalChapters.staySafe, label: {
                        ZStack {
                            RectangleCard(color: .blue)
                                .frame(height: 40)
                                .padding(.horizontal, 5)
                            
                            Text("Next: Staying Safe (Chapter 4.3)")
                                .foregroundStyle(Color.white)
                        }
                    })
                    .padding(.top, 10)
                    
                }
            }
            .padding(.horizontal)
        }.scrollIndicators(.hidden)
        
    }
}

#Preview {
    ReducingRisksView()
        .environmentObject(LegalManager())
}
