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
                    
                    NavigationLink(value: LegalChapters.computerMisuseAct, label: {
                        ZStack {
                            RectangleCard(color: .blue)
                                .frame(height: 40)
                                .padding(.horizontal, 5)
                            
                            Text("Next: Computer Misuse Act (Chapter 2)")
                                .foregroundStyle(Color.white)
                        }
                    })
                    .padding(.top, 10)
                    
                }
            }.padding(.horizontal)
        }.scrollIndicators(.hidden)
            .navigationDestination(for: LegalChapters.self) { state in
                switch state {
                case .computerSoftwareCrime:
                    LegalView()
                case .computerMisuseAct:
                    ComputerMisuseAct1990()
                        .environmentObject(legalManager)
                case .cmaAmendments:
                    CMAAmendments()
                        .environmentObject(legalManager)
                case .Privacy:
                    PrivacyView()
                        .environmentObject(legalManager)
                }
            }
    }
}

#Preview {
    LegalView()
}
