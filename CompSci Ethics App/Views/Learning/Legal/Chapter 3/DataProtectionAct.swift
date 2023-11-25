//
//  DataProtectionAct.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 25/11/2023.
//

import SwiftUI

struct DataProtectionAct: View {
    
    @EnvironmentObject var legalManager:LegalManager
    
    var body: some View {
        ScrollView {
            VStack(alignment:.leading){
                if let data = legalManager.legalData.first?.dpa1998{
                    
                    Text(data.chapter)
                        .font(.callout)
                        .opacity(0.6)
                    
                    Text(data.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.bottom,5)
                    
                    Text(data.description)
                        .padding(.bottom,5)
                    
                    ForEach(data.keyPrinciples, id:\.self){d in
                        
                        HStack {
                            Text("•")
                            Text(d)
                        }
                        .padding(.bottom, 2)
                        
                    }
                    
                    Text("Who Does the DPA Apply to?")
                        .font(.headline)
                        .padding(.bottom, 2)
                    
                    Text("The DPA applies to data held on:")
                        .padding(.bottom, 2)
                    
                    ForEach(data.dpaAppliesToDataHeldOn, id:\.self){d in
                        
                        HStack {
                            Text("•")
                            Text(d)
                        }
                        .padding(.bottom, 2)
                        
                    }
                    
                    ForEach(data.dataStoringExamples, id:\.self){d in
                        
                        HStack {
                            Text("e.g.")
                            Text(d)
                        }
                        .padding(.bottom, 2)
                        
                    }
                    
                    Text("Subject Rights Amendments")
                        .font(.headline)
                        .padding(.bottom, 2)
                    
                    Text(data.subjectRights1994)
                        .padding(.bottom, 2)
                    
                    Text("This changed in the 1998 amendment where the act: ")
                        .padding(.bottom, 2)
                    
                    ForEach(data.subjectRights1998, id:\.self){d in
                        
                        HStack {
                            Text("•")
                            Text(d)
                        }
                        .padding(.bottom, 2)
                        
                    }
                    
                    NavigationLink(value: LegalChapters.gdpr, label: {
                        ZStack {
                            RectangleCard(color: .blue)
                                .frame(height: 40)
                                .padding(.horizontal, 5)
                            
                            Text("Next: GDPR (Chapter 3.3)")
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
    DataProtectionAct()
        .environmentObject(LegalManager())
}
