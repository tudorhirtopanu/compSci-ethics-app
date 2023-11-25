//
//  StaySafeView.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 25/11/2023.
//

import SwiftUI

struct StaySafeView: View {
    
    @EnvironmentObject var legalManager:LegalManager
    
    @EnvironmentObject var navigationManager:NavigationManager
    
    var body: some View {
        
        ScrollView {
            VStack(alignment:.leading){
                if let data = legalManager.legalData.first?.risksSummary{
                    
                    Text(data.chapter)
                        .font(.callout)
                        .opacity(0.6)
                    
                    Text(data.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.bottom,5)
                    
                    Text(data.description)
                        .padding(.bottom,5)
                    
                    ForEach(data.stepsToSecure, id:\.self) {s in
                        HStack {
                            Text("•")
                            Text(s)
                        }
                        .padding(.bottom, 2)
                    }
                    
                    Button(action: {
                        navigationManager.popToRoot()
                    }, label: {
                        ZStack {
                            RectangleCard(color: .blue)
                                .frame(height: 40)
                                .padding(.horizontal, 5)
                            
                            Text("Finish")
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
    StaySafeView()
        .environmentObject(LegalManager())
        .environmentObject(NavigationManager())
}
