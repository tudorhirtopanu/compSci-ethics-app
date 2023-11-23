//
//  IntellectualPropertyView.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 21/11/2023.
//

import SwiftUI
import AVKit

struct IntellectualPropertyView: View {
    
    @State var videoRatio: CGFloat = 1080/1920
    
    @StateObject var ipm = IntellectualPropertyManager()
    
    @EnvironmentObject var navigationManager:NavigationManager
    
    var body: some View {
                
        GeometryReader {geo in
            ScrollView {
                    VStack(alignment: .leading){
                        
                        if let data = ipm.intellectualPropertyData.first {
                            
                            Text("Chapter One")
                                .font(.callout)
                                .opacity(0.6)
                            Text(data.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.bottom,5)
                            
                            Text(data.definition)
                                .padding(.bottom,5)
                            
                            ForEach(data.examples, id:\.self){d in
                                Text("- "+d)
                                    .font(.caption)
                            }
                            .padding(.bottom,2)
                        
                        // TODO: Change force unwrap
                        // TODO: AVPlayer causing some warnings
                        VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "IPBasics2", withExtension: "mov")!))
                            .frame(height: geo.size.width * videoRatio)
                            .cornerRadius(5)
                            
                            Text("Protecting Intellectual Property")
                                .font(.headline)
                                .padding([.top, .bottom], 5)
                            
                            Text(data.protectionDescription)
                                .padding(.bottom, 20)
                            
                            ForEach(data.protectionOverview){p in
                                HStack{
                                    Text(String(p.id + 1)+".")
                                    
                                    Text(p.name)
                                        
                                }
                                .fontWeight(.medium)
                                .padding(.bottom, 5)
                                
                                ForEach(p.protects, id:\.self){d in
                                    Text("• "+d)
                                        .font(.caption)
                                        .padding(.bottom, 2)
                                }
                                
                                if let examples = p.examples {
                                    Text("(e.g. "+examples+")")
                                        .font(.caption)
                                }
                                
                            }
                            
                            Text(data.purposeTitle)
                                .font(.headline)
                                .padding([.top, .bottom], 5)
                            
                            ForEach(data.purpose, id:\.self){p in
                                Text("• "+p)
                                    .multilineTextAlignment(.leading)
                                    .padding(.bottom, 2)
                                    
                            }
                            
                            NavigationLink(value: IntellectualPropertyChapters.copyright, label: {
                                ZStack {
                                    RectangleCard(color: .blue)
                                        .frame(height: 40)
                                        .padding(.horizontal, 5)
                                    
                                    Text("Next Chapter: Copyright")
                                        .foregroundStyle(Color.white)
                                }
                            })
                            .padding(.top, 10)

                        } else {
                            
                        }
                    }
            }
            .scrollIndicators(.hidden)
            
        }
        .padding(.horizontal)
        
        .navigationDestination(for: IntellectualPropertyChapters.self) { state in
            switch state {
            case .introduction:
                IntellectualPropertyView()
            case .copyright:
                CopyrightView()
                    .environmentObject(ipm)
                    .environmentObject(navigationManager)
            case .patents:
                PatentsView()
                    .environmentObject(ipm)
                    .environmentObject(navigationManager)
            }
        }
    }
}

#Preview {
    NavigationStack {
        IntellectualPropertyView()
            .environmentObject(NavigationManager())
    }
}
