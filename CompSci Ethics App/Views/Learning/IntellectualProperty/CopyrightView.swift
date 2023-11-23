//
//  CopyrightView.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 22/11/2023.
//

import SwiftUI
import AVKit

struct CopyrightView: View {
    
    @EnvironmentObject var ipm:IntellectualPropertyManager
    
    let videoRatio: CGFloat = 1080/1920
    
    var body: some View {
        
        GeometryReader { geo in
            ScrollView {
                VStack(alignment: .leading){
                    if let data = ipm.intellectualPropertyData.first?.copyright {
                        
                        Text("Chapter Two")
                            .font(.callout)
                            .opacity(0.6)
                        
                        Text(data.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.bottom,5)
                        
                        Text(data.description)
                            .padding(.bottom,5)
                        
                        VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "Copyright", withExtension: "mp4")!))
                            .frame(height: geo.size.width * videoRatio)
                            .cornerRadius(5)
                        
                        Text("What Does Copyright Cover?")
                            .font(.headline)
                            .padding([.top, .bottom], 5)
                        
                        ForEach(data.covers, id: \.self){ c in
                            HStack {
                                Text("•")
                                Text(c)
                                    .padding(.bottom,2)
                            }
                        }
                        
                        Text(data.copyrightFact)
                            .padding(.bottom,5)
                        
                        ForEach(data.copyrightFactExamples, id: \.self){ c in
                            Text("• "+c)
                                .font(.caption)
                                .padding(.bottom, 2)
                        }
                        
                        Text(data.license)
                            .padding(.bottom,5)
                        
                        Text(data.softwareLimitation)
                        
                        NavigationLink(value: IntellectualPropertyChapters.patents, label: {
                            ZStack {
                                RectangleCard(color: .blue)
                                    .frame(height: 40)
                                    .padding(.horizontal, 5)
                                
                                Text("Next Chapter: Patents")
                                    .foregroundStyle(Color.white)
                            }
                        })
                        .padding(.top, 10)
                        
                    }
                }
            }
            .scrollIndicators(.hidden)
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    CopyrightView()
        .environmentObject(IntellectualPropertyManager())
}
