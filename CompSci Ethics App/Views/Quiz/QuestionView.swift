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
            
            HStack {
                
                Text(qm.chosenQuestions[qm.questionNumber].sectionTag)
                Spacer()
                                
                Text("\(qm.questionNumber + 1)/\(qm.chosenQuestions.count)")
                    .font(.title3)
                
            }

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
                        if hasSubmitted == false {
                            // Cards are white and selected one is grey
                            RectangleCard(color: selectedIndex == i ? .gray : .white)
                                //.opacity(0.4)
                                .frame(height: 90)
                        } else {
                            
                            // correct answer selected, make it green
                            if qm.chosenQuestions[qm.questionNumber].answers[selectedIndex ?? -1].correct == true {
                             RectangleCard(color: selectedIndex == i ? .green : .white)
                                    .frame(height: 90)
                            } else {
                                
                                var cardColour:Color {
                                    if selectedIndex == i {
                                        return .red
                                    } else {
                                        return .white
                                    }
                                }
                                
                                RectangleCard(color: cardColour)
                                .frame(height: 90)
                            }
                            
                        }
                        
                        
                        // when locked in, make correct card green and wrong red.
//
                        
                        
                        
                        Text(qm.chosenQuestions[qm.questionNumber].answers[i].text)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(Color.black)
                        
                    }
                })
                
            }
            
            if hasSubmitted {
                
                Button(action: {
                    
                    // add function so that it checks if there is a nect question
                    qm.increaseQuestionNum()
                    
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
