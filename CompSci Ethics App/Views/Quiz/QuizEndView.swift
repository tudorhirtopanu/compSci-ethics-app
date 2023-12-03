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
    
    @Bindable var moduleItem:ModuleData
            
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
        
        let previousTotal = moduleItem.totalQuestions
        
        let newTotal = previousTotal + qm.quiz[qm.section.rawValue].questions.count
        
        //TODO: Change this so actual section data is passed in
        let item = ModuleData(name: qm.returnSectionDetails(sectionId: qm.section.rawValue), totalQuestions: newTotal, sectionTotalQuestions: [["S1":30],["S2":24]], sectionCorrectAnswers: [["S1":20],["S2":18]])
        
        context.insert(item)
        
    }
    
}

#Preview {
    do{
        
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        
        let container = try ModelContainer(for: ModuleData.self, configurations: config)
        let example = ModuleData(name: "Ethics", totalQuestions: 43, sectionTotalQuestions: [["S1":30],["S2":24]], sectionCorrectAnswers: [["S1":20],["S2":18]])
        
        return QuizEndView(moduleItem: example)
            .environmentObject(NavigationManager())
    } catch {
        fatalError("Failed to create model container")
    }
    
}
