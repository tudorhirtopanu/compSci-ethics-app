//
//  RectangleCard.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 22/11/2023.
//

import SwiftUI

struct RectangleCard: View {
    
    var color:Color
    
    var body: some View {
        
        Rectangle()
            .foregroundColor(color)
            .clipShape(.rect(cornerSize: CGSize(width: 10, height: 10)))
            .shadow(radius: 3)
        
    }
}

#Preview {
    RectangleCard(color: .blue)
        .padding()
}
