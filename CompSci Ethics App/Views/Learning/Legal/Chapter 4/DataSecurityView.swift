//
//  DataSecurityView.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 25/11/2023.
//

import SwiftUI

struct DataSecurityView: View {
    
    @EnvironmentObject var legalManager:LegalManager
    
    var body: some View {
        
        ScrollView {
            VStack(alignment:.leading){
                if let data = legalManager.legalData.first?.dataSecurity{
                    
                    Text(data.chapter)
                        .font(.callout)
                        .opacity(0.6)
                    
                    Text(data.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.bottom,5)
                    
                    Text(data.definition)
                        .padding(.bottom,5)
                    
                    Text("Examples of Breaches")
                        .font(.headline)
                        .padding(.bottom, 2)
                    
                    ForEach(data.breachExamples, id:\.self){d in
                        
                        HStack {
                            Text("•")
                            Text(d)
                        }
                        .padding(.bottom, 2)
                        
                    }
                    
                    Text("Possible Impacts:")
                        .font(.headline)
                        .padding(.bottom, 2)
                    
                    ForEach(data.breachImpacts, id:\.self){d in
                        
                        HStack {
                            Text("•")
                            Text(d)
                        }
                        .padding(.bottom, 2)
                        
                    }
                    
                    Text(data.riskResponsibility)
                        .multilineTextAlignment(.center)
                        .fontWeight(.medium)
                        .padding([.top, .bottom], 5)
                    
                    Text("Link to BCS")
                        .font(.headline)
                        .padding(.bottom, 2)
                    
                    ForEach(data.bcsLink){ b in
                            Text(b.codeName)
                        HStack {
                            Text("-")
                            Text(b.explanation)
                                .font(.footnote)
                        }
                        .padding(.bottom, 5)
                    }
                    
                    Text(data.dpaLink.name)
                        .font(.headline)
                        .padding(.bottom, 2)
                    
                    Text(data.dpaLink.description)
                        .padding(.bottom, 2)
                    
                    Text(data.dpaLink.importantNote)
                    
                }
            }.padding(.horizontal)
        }.scrollIndicators(.hidden)
        
    }
}

#Preview {
    DataSecurityView()
        .environmentObject(LegalManager())
}
