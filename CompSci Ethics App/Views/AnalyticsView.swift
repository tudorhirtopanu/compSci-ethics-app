//
//  AnalyticsView.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 02/12/2023.
//

import SwiftData
import SwiftUI

struct AnalyticsView: View {
        
    @Environment(\.modelContext) var context
    @Query var items:[ModuleData]
    
    var body: some View {
        VStack {
            
            List{
                ForEach(items) {i in
                    VStack{
                        Text(i.name)
                        Text(String(i.totalQuestions))
                        
                        ForEach(i.sectionTotalQuestions, id: \.self) { topic in
                                        HStack {
                                            ForEach(topic.sorted(by: <), id: \.key) { key, value in
                                                Text("\(key): \(value)")
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
        }
    }
    
}

#Preview {
    AnalyticsView()
        .modelContainer(previewContainer)
}
