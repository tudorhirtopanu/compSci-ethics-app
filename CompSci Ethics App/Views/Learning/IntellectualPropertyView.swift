//
//  IntellectualPropertyView.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 21/11/2023.
//

import SwiftUI
import AVKit

struct IntellectualPropertyView: View {
    
    let videoRatio: CGFloat = 1080/1920
    
    @StateObject var ipm = IntellectualPropertyManager()
    
    var body: some View {
        GeometryReader {geo in
            VStack(alignment: .leading){
                
                Text(ipm.intellectualPropertyData[0].title)
                    .font(.title)
                    .fontWeight(.bold)
                
                // TODO: Change force unwrap
                // TODO: AVPlayer causing some warnings
                VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "IPBasics", withExtension: "mp4")!))
                    .frame(height: geo.size.width * videoRatio)
                    .cornerRadius(5)
                
            }
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    IntellectualPropertyView()
}
