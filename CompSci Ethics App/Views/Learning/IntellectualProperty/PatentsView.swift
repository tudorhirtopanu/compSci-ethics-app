//
//  PatentsView.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 23/11/2023.
//

import SwiftUI
import AVKit

struct PatentsView: View {
    
    @EnvironmentObject var ipm:IntellectualPropertyManager
    
    let videoRatio: CGFloat = 1080/1920
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(alignment: .leading){
                    if let data = ipm.intellectualPropertyData.first?.patents {
                        
                        Text("Chapter Three")
                            .font(.callout)
                            .opacity(0.6)
                        
                        Text(data.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.bottom,5)
                        
                        Text(data.definition)
                            .padding(.bottom,5)
                        
                        VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "Patents", withExtension: "mp4")!))
                            .frame(height: geo.size.width * videoRatio)
                            .cornerRadius(5)
                        
                        Text("Why Use Patents?")
                            .font(.headline)
                            .padding([.top, .bottom], 5)
                        
                        ForEach(data.patentFacts, id: \.self){ c in
                                Text(c)
                                    .padding(.bottom,2)
                        }
                        
                        Text("Boundaries")
                            .font(.headline)
                            .padding([.top, .bottom], 5)
                        
                        Text(data.boundaries)
                            .padding(.bottom, 5)
                        
                        ForEach(data.boundaryExample, id: \.self){ c in
                            HStack {
                                Text("• ")
                                Text(c)
                                    .padding(.bottom,2)
                            }
                        }
                        
                        NavigationLink(value: IntellectualPropertyChapters.patents, label: {
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
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding(.horizontal)
    }
}

#Preview {
    PatentsView()
        .environmentObject(IntellectualPropertyManager())
}
