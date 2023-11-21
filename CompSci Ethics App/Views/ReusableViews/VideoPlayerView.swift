//
//  VideoPlayer.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 21/11/2023.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    
    
//    @State var player = AVPlayer(url: Bundle.main.url(forResource: "iMac2021", withExtension: "mp4")!)
    
    var body: some View {
        
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "IPBasics", ofType: "mp4")!)
        let videoRatio: CGFloat = 1080/1920
        
        GeometryReader{ geo in
            
            VStack(alignment: .leading){
                VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "IPBasics", withExtension: "mp4")!))
                    .frame(height: 400)
            }
            
        }
    }
}

#Preview {
    VideoPlayerView()
}
