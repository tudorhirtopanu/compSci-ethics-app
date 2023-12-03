//
//  QuizView.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 20/11/2023.
//

import SwiftUI
import SwiftData

enum QuizSections:Int {
    case ethics = 0
    case legal = 1
    case intellectualProperty = 2
}

enum QuizNavigation {
    case quiz
}

struct QuizView: View {
    
    @StateObject var qm = QuestionsManager()
    @EnvironmentObject var nm: NavigationManager
    
    @State var section:QuizSections = .ethics
    @State private var selectedIndex:Int?
    
    @Environment(\.modelContext) var context
    @Query(sort: \ModuleData.name) var item:[ModuleData]
    
    var body: some View {
        
        ScrollView {
            VStack(alignment:.leading){
                
                Text("Select a Section")
                
                Picker("Section", selection: $qm.section){
                    Text("Ethics").tag(QuizSections.ethics)
                    Text("Legal").tag(QuizSections.legal)
                    Text("Intellectual Property").tag(QuizSections.intellectualProperty)
                }
                .pickerStyle(.segmented)
                
                VStack{
                    Button(action: {
                        qm.section = .ethics
                    }, label: {
                        ZStack {
                            RectangleCard(color: .blue)
                                .frame(height:50)
                            
                            Text("Ethics")
                        }
                    })
                    .foregroundStyle(Color.white)
                    
                    Button(action: {
                        qm.section = .legal
                    }, label: {
                        ZStack {
                            RectangleCard(color: .blue)
                                .frame(height:50)
                            
                            Text("Legal")
                        }
                    })
                    .foregroundStyle(Color.white)
                    
                    Button(action: {
                        qm.section = .intellectualProperty
                    }, label: {
                        ZStack {
                            RectangleCard(color: .blue)
                                .frame(height:50)
                            
                            Text("Intellectual Property")
                        }
                    })
                    .foregroundStyle(Color.white)
                    
                }
                
                NavigationLink(value: QuizNavigation.quiz, label: {
                    Text("Go To Quiz")
                })
                .navigationDestination(for: QuizNavigation.self) { state in
                    switch state {
                    case .quiz:
                        
                        QuestionView()
                            .environmentObject(qm)
                            .environmentObject(nm)
                    }
                }
                
            }.padding(.horizontal)
        }
        
    }
    
    private func addItems() {
        
        let items = ModuleData(name: "Test", totalQuestions: 12)
        
        context.insert(items)
        
    }
    
}

#Preview {
    NavigationStack {
        QuizView()
    }
}
