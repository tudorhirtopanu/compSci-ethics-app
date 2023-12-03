//
//  QuizEndView.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 01/12/2023.
//

import SwiftData
import SwiftUI

struct QuizEndView: View {
    
    @EnvironmentObject var nm:NavigationManager
    @EnvironmentObject var qm:QuestionsManager
    @Environment(\.modelContext) var context
    
    
            
    var body: some View {
        VStack {
            Text("End of Quiz")
            
            Button(action: {
                nm.goBackOne()
            }, label: {
                Text("Back")
            })
        }
        .onAppear{
            addItem()
        }
        
        
        
    }
    
    private func addItem() {
        
        //let object = items.first(where: items.)
        
        //let newQuestions = questionNum + qm.quiz[qm.section.rawValue].questions.count
        let item = ModuleData(name: qm.returnSectionDetails(sectionId: qm.section.rawValue), totalQuestions: qm.quiz[qm.section.rawValue].questions.count)
        
        context.insert(item)
        
    }
    
}

//#Preview {
//    QuizEndView()
//        .environmentObject(NavigationManager())
//}
