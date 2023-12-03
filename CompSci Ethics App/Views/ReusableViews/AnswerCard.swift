//
//  AnswerCard.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 02/12/2023.
//

import SwiftUI

struct AnswerCard: View {
    
    var color:Color
    var opacity:Double
    
    var body: some View{
    
        Rectangle()
            .foregroundColor(color)
            .clipShape(.rect(cornerSize: CGSize(width: 10, height: 10)))
            .shadow(radius: 3)
            .opacity(opacity)
    
    }
}

#Preview {
    AnswerCard(color: .blue, opacity: 0.8)
        .padding()
}
