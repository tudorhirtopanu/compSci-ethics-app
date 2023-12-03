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
        .onDisappear {
            qm.clearDictionary()
        }
        
        
        
    }
    
    private func mergeDictionaries(oldDict:[[String:Int]], newDict:[[String:Int]]) -> [[String:Int]] {
        
        var updatedSectionCorrectAnswers = oldDict
        
        // Merge dictionaries in updatedSectionCorrectAnswers and qm.subjectCorrectAnswers
        for subjectCorrectAnswers in newDict {
            for (key, value) in subjectCorrectAnswers {
                if let existingIndex = updatedSectionCorrectAnswers.firstIndex(where: { $0.keys.contains(key) }),
                   let existingValue = updatedSectionCorrectAnswers[existingIndex][key] {
                    updatedSectionCorrectAnswers[existingIndex][key] = existingValue + value
                } else {
                    // If the key doesn't exist, add a new dictionary to updatedSectionCorrectAnswers
                    //updatedSectionCorrectAnswers.append([key: value])
                }
            }
        }
        
        return updatedSectionCorrectAnswers
        
    }
    
    private func addItem() {
        
        //let object = items.first(where: items.)
        
        let previousTotal = moduleItem.totalQuestions
        let newTotal = previousTotal + qm.quiz[qm.section.rawValue].questions.count
        
  /*
//        var updatedSectionCorrectAnswers = moduleItem.sectionCorrectAnswers
//           
//           // Merge dictionaries in updatedSectionCorrectAnswers and qm.subjectCorrectAnswers
//           for subjectCorrectAnswers in qm.subjectCorrectAnswers {
//               for (key, value) in subjectCorrectAnswers {
//                   if let existingIndex = updatedSectionCorrectAnswers.firstIndex(where: { $0.keys.contains(key) }),
//                      let existingValue = updatedSectionCorrectAnswers[existingIndex][key] {
//                       updatedSectionCorrectAnswers[existingIndex][key] = existingValue + value
//                   } else {
//                       // If the key doesn't exist, add a new dictionary to updatedSectionCorrectAnswers
//                       updatedSectionCorrectAnswers.append([key: value])
//                   }
//               }
//           }
   */
        
        let correctAnswers = mergeDictionaries(oldDict: moduleItem.sectionCorrectAnswers, newDict: qm.subjectCorrectAnswers)
        let totalQuestions = mergeDictionaries(oldDict: moduleItem.sectionTotalQuestions, newDict: qm.subjectTotalQuestions)
        
        print(qm.subjectTotalQuestions)
        print(totalQuestions)
        
        let item = ModuleData(name: qm.returnSectionDetails(sectionId: qm.section.rawValue), totalQuestions: newTotal, sectionTotalQuestions: totalQuestions, sectionCorrectAnswers: correctAnswers)
        
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
