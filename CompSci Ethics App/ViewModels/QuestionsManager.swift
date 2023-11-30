//
//  QuestionsManager.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 28/11/2023.
//

import Foundation
import SwiftUI

class QuestionsManager:ObservableObject {
    
    @Published var quiz = [Quiz]()
    
    @Published var questionNumber = 0
    
    @Published var chosenQuestions:[Questions] = []
    
    var currentQuestion: Questions {
        let randomizedQuestions = quiz[0].questions.shuffled()
        return randomizedQuestions[questionNumber]
    }
    
    func randomizeQuestions(section:Int) -> [Questions] {
        let randomizedQuestions = quiz[section].questions.shuffled()
        
        return randomizedQuestions
    }
    
    init() {
        self.quiz = DataService.getLocalData(fileName: "Questions", fileType: "json", objectType: Quiz.self)
        
        self.chosenQuestions = randomizeQuestions(section: 1)
    }
    
    func returnQuestion() -> Questions {
        
        return quiz[1].questions[questionNumber]
    }
    
    func increaseQuestionNum() {
        
        if questionNumber < quiz[1].questions.count - 1 {
            questionNumber += 1
        }
    }
    
    func checkAnswer(selectedIndex: Int, currentQuestion:Questions) -> String {
        let selectedAnswer = currentQuestion.answers[selectedIndex]
            return selectedAnswer.correct ? "Correct" : "Wrong"
    }
    
}
