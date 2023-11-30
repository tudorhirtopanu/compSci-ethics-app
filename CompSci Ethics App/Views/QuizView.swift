//
//  QuizView.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 20/11/2023.
//

import SwiftUI

enum QuizSections:Int {
    case ethics = 0
    case legal = 1
    case intellectualProperty = 2
}

struct QuizView: View {
    
    @StateObject var questionManager = QuestionsManager()
    @State var section:QuizSections = .ethics
    
    var body: some View {
        
        ScrollView {
            VStack(alignment:.leading){
                
                Text("Select a Section")
                
                Picker("Section", selection: $section){
                    Text("Ethics").tag(QuizSections.ethics)
                    Text("Legal").tag(QuizSections.legal)
                    Text("Intellectual Property").tag(QuizSections.intellectualProperty)
                }
                .pickerStyle(.segmented)
                
//                NavigationLink(destination: {
//                    QuestionView(question: questionManager.quiz[section.rawValue].questions)
//                        .environmentObject(questionManager)
//                }, label: {
//                    Text("Go To Quiz")
//                })
                
            }.padding(.horizontal)
        }
        
    }
}

#Preview {
    NavigationStack {
        QuizView()
    }
}
