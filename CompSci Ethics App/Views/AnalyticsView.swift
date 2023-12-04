//
//  AnalyticsView.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 02/12/2023.
//

import SwiftData
import SwiftUI
import Charts

struct AnalyticsView: View {
        
    @Environment(\.modelContext) var context
    @Query var items:[ModuleData]
    
    var body: some View {
        VStack {
            
            List{
                ForEach(items) {i in
                    
                    VStack{
                        
//                        Chart {
//                            
////                            ForEach(i.){
////                                
////                            }
//                            
//                        }
//                        
                        Text(i.name)
                        Text(String(i.totalQuestions))
                        
                        ForEach(i.sectionTotalQuestions, id: \.self) { topic in

                            HStack {
                                ForEach(topic.sorted(by: <), id: \.key) { key, value in
                                    if let totalQuestions = i.sectionTotalQuestions.first(where: { $0[key] != nil })?[key],
                                       let correctAnswers = i.sectionCorrectAnswers.first(where: { $0[key] != nil })?[key] {
                                        
                                        let percentage = returnPercentage(correct: correctAnswers, total: totalQuestions)
                                        
                                        Text("\(key): \(percentage)%")
                                    }
                                }
                            }
                        }
                        
                    }
                }.onDelete(perform: deleteItem)
            }
            
            
            Button(action: {
                addSample()
                
            }, label: {
                Text("Add")
            })
            
        }
    }
    
    func addSample() {
        
        let module = ModuleData(name: "Test Data ", totalQuestions: 14, sectionTotalQuestions: [["S1":30],["S2":24]], sectionCorrectAnswers: [["S1":20],["S2":18]])
        
        context.insert(module)
        
    }
    
    func deleteItem(_ indexSet:IndexSet) {
        for index in indexSet {
            let items = items[index]
            context.delete(items)
            
            do {
               try context.save()
            } catch {
                print("Error saving")
            }
        }
    }
    
    func calculatePercentage(correct: Int, total: Int) -> Double {
        guard total > 0 else {
            return 0.0
        }
        return Double(correct) / Double(total) * 100.0
    }
    
    func returnPercentage(correct:Int, total:Int) -> Int {
        
        let percentage = calculatePercentage(correct: correct, total: total)
        
        return Int(percentage)
    }
    
}

#Preview {
    AnalyticsView()
        .modelContainer(previewContainer)
}
