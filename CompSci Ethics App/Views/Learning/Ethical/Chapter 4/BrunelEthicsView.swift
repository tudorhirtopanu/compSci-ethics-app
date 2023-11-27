//
//  BrunelEthicsView.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 27/11/2023.
//

import SwiftUI

struct BrunelEthicsView: View {
    
    @EnvironmentObject var ethicsManager:EthicsManager
    @EnvironmentObject var navigationManager:NavigationManager
    
    var body: some View {
        ScrollView {
            VStack(alignment:.leading){
                
                if let data = ethicsManager.ethicsData.first?.brunelEthics {
                    
                    Text(data.chapter)
                        .font(.callout)
                        .opacity(0.6)
                    
                    Text(data.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom,5)
                    
                    Text(data.description)
                        .padding(.bottom,5)
                    
                    ForEach(data.guidelinesToFollow){g in
                        
                        Text(g.title)
                            .font(.headline)
                            .padding(.bottom,2)
                        
                        ForEach(g.description, id:\.self) { d in
                            
                                Text(d)
                                .padding(.bottom, 5)
                            
                        }
                        
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
    BrunelEthicsView()
        .environmentObject(EthicsManager())
        .environmentObject(NavigationManager())
}
