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
    @Query var items:[ModuleData]
    
    @State var itemToEdit:ModuleData?
    
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
                        
                        selectItemToEdit(sectionName: qm.quiz[QuizSections.ethics.rawValue].title)
                        
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
                        
                        selectItemToEdit(sectionName: qm.quiz[QuizSections.legal.rawValue].title)
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
                        
                        selectItemToEdit(sectionName: qm.quiz[QuizSections.intellectualProperty.rawValue].title)
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
                        QuestionView(moduleItem: itemToEdit ?? createDataItem(sectionName: qm.quiz[section.rawValue].title))
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
    
    private func selectItemToEdit(sectionName:String) {
        
        if let item = items.first(where: {$0.name == sectionName}){
            itemToEdit = item
        }
        
    }
    
    private func createDataItem(sectionName:String) -> ModuleData {
        
        return ModuleData(name: sectionName, totalQuestions: 0)
        
    }
    
}

#Preview {
    NavigationStack {
        QuizView()
    }
}
