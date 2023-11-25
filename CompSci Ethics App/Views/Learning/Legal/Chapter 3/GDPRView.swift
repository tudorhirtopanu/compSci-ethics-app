//
//  GDPRView.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 25/11/2023.
//

import SwiftUI

struct GDPRView: View {
    
    @EnvironmentObject var legalManager:LegalManager
    
    var body: some View {
        
        ScrollView {
            VStack(alignment:.leading){
                if let data = legalManager.legalData.first?.gdpr{
                    
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
                    
                    Text(data.gdprApplications.title)
                        .font(.headline)
                        .padding(.bottom, 2)
                    
                    Text(data.gdprApplications.shortDescr)
                        .padding(.bottom, 2)
                    
                    ForEach(data.gdprApplications.appliesTo, id:\.self){d in
                        
                        HStack {
                            Text("•")
                            Text(d)
                        }
                        .padding(.bottom, 2)
                        
                    }
                    
                    Text(data.gdprApplications.secondShortDescr)
                        .padding(.bottom, 2)
                    
                    ForEach(data.gdprApplications.doesntApplyTo, id:\.self){d in
                        
                        HStack {
                            Text("•")
                            Text(d)
                        }
                        .padding(.bottom, 2)
                        
                    }
                    
                    Text(data.subTitle)
                        .font(.headline)
                        .padding(.bottom, 2)
                    
                    ForEach(data.gdprAppliesTo){d in
                        
                        Text(d.name)
                        .padding(.bottom, 2)
                        
                        ForEach(d.examples, id:\.self){e in
                            HStack {
                                Text("•")
                                Text(e)
                            }
                            .padding(.bottom, 2)
                        }
                        
                    }
                    
                    Text(data.exceptions)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .padding(.top,3)
                        .padding(.bottom, 5)
                    
                    Text(data.subTitle2)
                        .font(.headline)
                        .padding(.bottom, 2)
                    
                    ForEach(data.personalDataPrinciples, id:\.self){d in
                        
                        HStack {
                            Text("•")
                            Text(d)
                        }
                        .padding(.bottom, 2)
                        
                    }
                    
                }
            }.padding(.horizontal)
        }.scrollIndicators(.hidden)
        
    }
}

#Preview {
    GDPRView()
        .environmentObject(LegalManager())
}
