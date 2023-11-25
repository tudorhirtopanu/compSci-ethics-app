//
//  LegalView.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 21/11/2023.
//

import SwiftUI

struct LegalView: View {
    
    @StateObject var legalManager = LegalManager()
    
    var body: some View {
        ScrollView {
            VStack(alignment:.leading){
                if let data = legalManager.legalData.first?.softwareCrimes{
                    
                    Text(data.chapter)
                        .font(.callout)
                        .opacity(0.6)
                    
                    Text(data.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom,5)
                    
                    ForEach(data.softwareCrimeTypes){s in
                        
                        HStack {
                            
                            Text(String(s.id + 1)+".")
                                .font(.headline)
                                .padding(.bottom, 2)
                            
                            Text(s.name)
                                .font(.headline)
                                .padding(.bottom, 2)
                        }
                        
                                                
                        ForEach(s.definition, id: \.self){d in
                            Text(d)
                                .padding(.bottom, 10)
                        }
                        
                        if let examples = s.examples {
                            ForEach(examples, id: \.self){e in
                                HStack {
                                    Text("-")
                                    Text(e)
                                }
                            }
                        }
                        
                        
                        
                    }
                    
                    
                }
            }.padding(.horizontal)
        }.scrollIndicators(.hidden)
    }
}

#Preview {
    LegalView()
}
