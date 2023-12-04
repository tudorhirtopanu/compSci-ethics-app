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
                nm.popToRoot()
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
    
    private func mergeDictionaries(oldDict: [[String: Int]], newDict: [[String: Int]]) -> [[String: Int]] {
        
        var updatedSectionCorrectAnswers = oldDict.map { $0 }

        // Merge dictionaries in updatedSectionCorrectAnswers and qm.subjectCorrectAnswers
        for subjectCorrectAnswers in newDict {
            for (key, value) in subjectCorrectAnswers {
                if let existingIndex = updatedSectionCorrectAnswers.firstIndex(where: { $0.keys.contains(key) }),
                   let existingValue = updatedSectionCorrectAnswers[existingIndex][key] {
                    updatedSectionCorrectAnswers[existingIndex][key] = existingValue + value
                } else {
                    // If the key doesn't exist, add a new dictionary to updatedSectionCorrectAnswers
                    updatedSectionCorrectAnswers.append([key: value])
                }
            }
        }

        return updatedSectionCorrectAnswers
    }
    
    func updateDictionaries(oldDicts: [[String: Int]], newDicts: [[String: Int]]) -> [[String: Int]] {
        var updatedDicts = oldDicts

        for newDict in newDicts {
            for (key, value) in newDict {
                if let existingIndex = updatedDicts.firstIndex(where: { $0.keys.contains(key) }),
                   let existingValue = updatedDicts[existingIndex][key] {
                    updatedDicts[existingIndex][key] = existingValue + value
                } else {
                    // If the key doesn't exist, add a new dictionary to updatedDicts
                    updatedDicts.append([key: value])
                }
            }
        }

        return updatedDicts
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
        let correctAnswers = updateDictionaries(oldDicts: moduleItem.sectionCorrectAnswers, newDicts: qm.subjectCorrectAnswers)

        let totalQuestions = updateDictionaries(oldDicts: moduleItem.sectionTotalQuestions, newDicts: qm.subjectTotalQuestions)
        
        print(moduleItem.name)
        print(moduleItem.sectionTotalQuestions) // this is causing the bug
        print(qm.subjectTotalQuestions)
        print("----------")
        print(moduleItem.name)
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
