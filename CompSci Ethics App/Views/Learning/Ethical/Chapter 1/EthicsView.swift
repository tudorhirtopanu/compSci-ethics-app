//
//  EthicsView.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 21/11/2023.
//

import SwiftUI

struct EthicsView: View {
    
    @StateObject var ethicsManager = EthicsManager()
    
    var body: some View {
        
        ScrollView {
            VStack(alignment:.leading){
                
                if let data = ethicsManager.ethicsData.first?.ethicalBehaviour {
                    
                    Text(data.chapter)
                        .font(.callout)
                        .opacity(0.6)
                    
                    Text(data.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom,5)
                    
                }
                
            }
        }
        
    }
}

#Preview {
    EthicsView()
}
