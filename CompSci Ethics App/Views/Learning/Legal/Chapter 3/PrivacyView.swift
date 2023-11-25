//
//  PrivacyView.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 25/11/2023.
//

import SwiftUI

struct PrivacyView: View {
    
    @EnvironmentObject var legalManager:LegalManager
    
    var body: some View {
        
        ScrollView {
            VStack(alignment:.leading){
                if let data = legalManager.legalData.first?.privacy{
                    
                    Text(data.chapter)
                        .font(.callout)
                        .opacity(0.6)
                    
                    Text(data.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.bottom,5)
                    
                    Text(data.definition)
                        .padding(.bottom,5)
                    
                    Text(data.privacyTemp)
                        .padding(.bottom,5)
                    
                    Text("Issues Caused By Data")
                        .font(.headline)
                        .padding(.bottom, 2)
                    
                    ForEach(data.dataIssues, id:\.self){d in
                        HStack {
                            Text("•")
                            Text(d)
                        }
                        .padding(.bottom, 2)
                    }
                    
                    Text(data.solution)
                    
                    NavigationLink(value: LegalChapters.dpaLegislation, label: {
                        ZStack {
                            RectangleCard(color: .blue)
                                .frame(height: 40)
                                .padding(.horizontal, 5)
                            
                            Text("Next: DPA Legislation (Chapter 3.1)")
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
    PrivacyView()
        .environmentObject(LegalManager())
}
