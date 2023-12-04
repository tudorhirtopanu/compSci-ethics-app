//
//  QuestionView.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 29/11/2023.
//

import SwiftData
import SwiftUI

struct CustomAnswerButton: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.99 : 1)
    }
    
}

struct QuestionView: View {
    
    @EnvironmentObject var qm:QuestionsManager
    @EnvironmentObject var nm:NavigationManager
    
    @State var questionArray:[Questions] = []
    
    @State var selectedIndex:Int?
    @State var displayAnswer:String?
    
    @State var hasSubmitted:Bool = false
    
    @State var quizEnded:Bool = false
    
    @Bindable var moduleItem:ModuleData
    
        
    var body: some View {
        
        VStack {
            
            Button(action: {
               // print("Correct Answer dictionary \(qm.subjectCorrectAnswers)")
                
                print("Total Questions dictionary \(qm.subjectTotalQuestions)")
            }, label: {
                Text("Print dictionaries")
            })
                                
            HStack {
                
                Text(qm.chosenQuestions[qm.questionNumber].sectionTag)
                Spacer()
                                
                Text("\(qm.questionNumber + 1)/\(qm.chosenQuestions.count)")
                    .font(.title3)
                
            }

            Text(qm.chosenQuestions[qm.questionNumber].text)
                .font(.title3)
                .fontWeight(.medium)
                .padding(.top, 10)
            
            Spacer()
            
            Text(displayAnswer ?? "")
            
            ForEach(qm.chosenQuestions[qm.questionNumber].answers.indices, id: \.self) { i in
                
                let correctIndex = qm.chosenQuestions[qm.questionNumber].answers.firstIndex(where: { $0.correct })
                
                Button(action: {
                    selectedIndex = i
                    
    
                }, label: {
                    ZStack {
                        if hasSubmitted == false {
                            // Cards are white and selected one is grey
                            AnswerCard(color: selectedIndex == i ? .gray : .white, opacity: selectedIndex == i ? 0.4 : 1)
                                //.opacity(0.4)
                                .frame(height: 90)
                        } else {
                            
                            // correct answer selected, make it green
                            if qm.chosenQuestions[qm.questionNumber].answers[selectedIndex ?? -1].correct == true {
                                AnswerCard(color: selectedIndex == i ? .green : .white, opacity: selectedIndex == i ? 0.7 : 1)
                                    .frame(height: 90)
                            } else {
                                
                                var cardColour:Color {
                                    if selectedIndex == i && qm.chosenQuestions[qm.questionNumber].answers[selectedIndex ?? -1].correct == false {
                                        return .red
                                    } else if correctIndex == i {
                                        return .green
                                    }
                                    else {
                                        return .white
                                    }
                                }
                                
                                AnswerCard(color: cardColour, opacity: selectedIndex == i ? 0.85 : 1)
                                .frame(height: 90)
                            }
                            
                        }
                        HStack {
                            Text(qm.chosenQuestions[qm.questionNumber].answers[i].text)
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(selectedIndex == i && hasSubmitted == true ? Color.black : Color.black)
                            .padding(.horizontal)
                            Spacer()
                        }
                        
                    }
                })
                .buttonStyle(CustomAnswerButton())
                .disabled(hasSubmitted)
                
            }
            
//            if qm.questionNumber < qm.quiz[qm.section.rawValue].questions.count - 1{
                if hasSubmitted {
                    if qm.questionNumber < qm.quiz[qm.section.rawValue].questions.count - 1{
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
                            quizEnded = true
                        }, label: {
                            ZStack{
                                RectangleCard(color: .blue)
                                    .frame(height: 60)
                                
                                
                                Text("Finish")
                                    .font(.title2)
                                    .fontWeight(.medium)
                                    .multilineTextAlignment(.leading)
                                    .foregroundStyle(Color.white)
                            }
                        })
                    }
                    
                    
                } else {
                    Button(action: {
                        
                        if let selectedIndex = selectedIndex {
                            let result = qm.checkAnswer(selectedIndex: selectedIndex, currentQuestion: qm.chosenQuestions[qm.questionNumber])
                            
                            if result {
                                qm.increaseNumberForKey(qm.chosenQuestions[qm.questionNumber].subjectTag, dictionaryArray: &qm.subjectCorrectAnswers)
                            }
                            
                            qm.increaseNumberForKey(qm.chosenQuestions[qm.questionNumber].subjectTag, dictionaryArray: &qm.subjectTotalQuestions)
                            
                            displayAnswer = result ? "Correct" : "Wrong"
                            //print(result)
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
                    .disabled(selectedIndex == nil)
                }
//            } else {
//                Text("Quiz End")
//            }
            
            
            
        }
        .fullScreenCover(isPresented: $quizEnded, content: {
            QuizEndView(moduleItem: moduleItem)
                .environmentObject(nm)
                .environmentObject(qm)
        })
        .onAppear{
//            for q in qm.quiz[qm.section.rawValue].questions {
//                
//                let key = q.subjectTag
//                
//                while(qm.subjectCorrectAnswers.contains { $0.keys.contains(key) } == false){
//                    let key = q.subjectTag
//                        qm.subjectCorrectAnswers.append([key: 0])
//                    }
//                }
            
            // For Correct Answers
            qm.createArrayOfSectionDictionaries(questions: qm.quiz[qm.section.rawValue].questions, dictionaryArray: &qm.subjectCorrectAnswers)
            
            // For Total Questions
            qm.createArrayOfSectionDictionaries(questions: qm.quiz[qm.section.rawValue].questions, dictionaryArray: &qm.subjectTotalQuestions)
                
        }
        
        .onDisappear{
            qm.questionNumber = 0
            qm.clearDictionary()
        }
        .padding(.horizontal)
        
    }
    
}

#Preview {
    do{
        
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        
        let container = try ModelContainer(for: ModuleData.self, configurations: config)
        let example = ModuleData(name: "Ethics", totalQuestions: 43, sectionTotalQuestions: [["S1":30],["S2":24]], sectionCorrectAnswers: [["S1":20],["S2":18]])
        
        return QuestionView(moduleItem: example)
            .environmentObject(QuestionsManager())
            .environmentObject(NavigationManager())
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
