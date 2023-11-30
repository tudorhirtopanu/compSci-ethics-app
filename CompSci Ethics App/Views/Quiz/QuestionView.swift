//
//  QuestionView.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 29/11/2023.
//

import SwiftUI



struct QuestionView: View {
    
    @EnvironmentObject var qm:QuestionsManager
    
    @State var questionArray:[Questions] = []
    
    @State var selectedIndex:Int?
    @State var displayAnswer:String?
    
    @State var hasSubmitted:Bool = false
        
    var body: some View {
        
        VStack {
            
            Text(String(qm.chosenQuestions.count))

            Text(qm.chosenQuestions[qm.questionNumber].text)
                .font(.title2)
                .fontWeight(.medium)
                .padding(.top, 10)
            
            Spacer()
            
            Text(displayAnswer ?? "")
            
            ForEach(qm.chosenQuestions[qm.questionNumber].answers.indices, id: \.self) { i in
                
                Button(action: {
                    selectedIndex = i
                }, label: {
                    ZStack {
                        
                        RectangleCard(color: selectedIndex == i ? .gray : .white)
                            .frame(height: 90)
                        
                        
                        Text(qm.chosenQuestions[qm.questionNumber].answers[i].text)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(Color.black)
                    }
                })
                
            }
            
            if hasSubmitted {
                
                Button(action: {
                    
                    // add function so that it checks if there is a nect question
                    qm.questionNumber += 1
                    
                    hasSubmitted = false
                    
                    selectedIndex = nil
                    
                    displayAnswer = nil
                    
                }, label: {
                    ZStack{
                        RectangleCard(color: .blue)
                            .frame(height: 60)
                        
                        
                        Text("Next Question")
                            .font(.title2)
                            .fontWeight(.medium)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(Color.white)
                    }
                })
                
            } else {
                Button(action: {
                    
                    if let selectedIndex = selectedIndex {
                        let result = qm.checkAnswer(selectedIndex: selectedIndex, currentQuestion: qm.chosenQuestions[qm.questionNumber])
                        
                        displayAnswer = result
                        print(result)
                    }
                    
                    hasSubmitted = true
                    
                }, label: {
                    ZStack{
                        RectangleCard(color: .blue)
                            .frame(height: 60)
                        
                        
                        Text("Lock In")
                            .font(.title2)
                            .fontWeight(.medium)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(Color.white)
                    }
                })
            }
            
        }
        .padding(.horizontal)
        
    }
}

#Preview {
    QuestionView()
        .environmentObject(QuestionsManager())
}
