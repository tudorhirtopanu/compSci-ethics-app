//
//  ComputerMisuseAct1990.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 25/11/2023.
//

import SwiftUI

struct ComputerMisuseAct1990: View {
    
    @EnvironmentObject var legalManager:LegalManager
    
    var body: some View {
        ScrollView {
            VStack(alignment:.leading){
                if let data = legalManager.legalData.first?.compMisuseAct{
                    
                    Text(data.chapter)
                        .font(.callout)
                        .opacity(0.6)
                    
                    Text(data.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.bottom,5)
                    
                    Text(data.description)
                    
                    Text(data.origin)
                        .padding(.bottom, 5)
                    
                    ForEach(data.actSections){s in
                        
                        Text(s.title)
                            .font(.headline)
                            .padding(.bottom, 2)
                        
                        Text(s.description)
                            .padding(.bottom, 2)
                        
                        Text(s.explanation)
                            .padding(.bottom, 2)
                        
                    }
                    
                    NavigationLink(value: LegalChapters.cmaAmendments, label: {
                        ZStack {
                            RectangleCard(color: .blue)
                                .frame(height: 40)
                                .padding(.horizontal, 5)
                            
                            Text("Next: CMA Amendments (Chapter 2.1)")
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
    ComputerMisuseAct1990()
        .environmentObject(LegalManager())
}
