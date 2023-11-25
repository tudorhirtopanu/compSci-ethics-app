//
//  SecurityThreatsView.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 25/11/2023.
//

import SwiftUI

struct SecurityThreatsView: View {
    
    @EnvironmentObject var legalManager:LegalManager
    
    var body: some View {
        
        ScrollView {
            VStack(alignment:.leading){
                if let data = legalManager.legalData.first?.securityThreats{
                    
                    Text(data.chapter)
                        .font(.callout)
                        .opacity(0.6)
                    
                    Text(data.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.bottom,5)
                    
                    ForEach(data.threats){ t in
                        
                        HStack {
                            Text(String(t.id + 1))
                                .font(.headline)
                                .padding(.bottom, 5)
                            
                            Text(t.name)
                                .font(.headline)
                                .padding(.bottom, 5)
                        }
                        
                        ForEach(t.examples, id:\.self) {e in
                            HStack {
                                Text("•")
                                Text(e)
                            }
                            .padding(.bottom, 2)
                        }
                        
                    }
                    
                }
            }.padding(.horizontal)
        }.scrollIndicators(.hidden)
        
    }
}

#Preview {
    SecurityThreatsView()
        .environmentObject(LegalManager())
}
