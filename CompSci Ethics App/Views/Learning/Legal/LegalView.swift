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
        VStack{
            if let data = legalManager.legalData.first{
                Text(data.title)
            }
        }
    }
}

#Preview {
    LegalView()
}
