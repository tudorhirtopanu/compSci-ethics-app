//
//  CMAAmendments.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 25/11/2023.
//

import SwiftUI

struct CMAAmendments: View {
    
    @EnvironmentObject var legalManager:LegalManager
    
    var body: some View {
        ScrollView {
            VStack(alignment:.leading){
                if let data = legalManager.legalData.first?.compMisuseActAmendments{
                    
                    Text(data.chapter)
                        .font(.callout)
                        .opacity(0.6)
                    
                    Text(data.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.bottom,5)
                    
                    Text(data.description)
                        .padding(.bottom,5)
                    
                    Text(data.amendmentTitle)
                        .font(.headline)
                        .padding(.bottom, 2)
                    
                    ForEach(data.amendmentDescription, id:\.self){d in
                        Text(d)
                            .padding(.bottom, 2)
                    }
                    
                    NavigationLink(value: LegalChapters.Privacy, label: {
                        ZStack {
                            RectangleCard(color: .blue)
                                .frame(height: 40)
                                .padding(.horizontal, 5)
                            
                            Text("Next: Privacy (Chapter 3)")
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
    CMAAmendments()
        .environmentObject(LegalManager())
}
