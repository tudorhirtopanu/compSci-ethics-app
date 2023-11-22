//
//  CopyrightView.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 22/11/2023.
//

import SwiftUI

struct CopyrightView: View {
    
    @EnvironmentObject var ipm:IntellectualPropertyManager
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                if let data = ipm.intellectualPropertyData.first?.copyright {
                    
                    Text(data.title)
                    
                }
            }
        }
    }
}

#Preview {
    CopyrightView()
        .environmentObject(IntellectualPropertyManager())
}
