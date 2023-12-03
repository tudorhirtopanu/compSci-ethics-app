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
    
    @Published var section: QuizSections = .ethics {
            didSet {
                // Call the method when the section value changes
                chosenQuestions = randomizeQuestions(section: section.rawValue)
            }
        }
    
    func returnSectionDetails(sectionId:Int) -> String {
        return quiz[sectionId].title
    }
    
    func randomizeQuestions(section:Int) -> [Questions] {
        let randomizedQuestions = quiz[section].questions.shuffled()
        
        return randomizedQuestions
    }
    
    init() {
        self.quiz = DataService.getLocalData(fileName: "Questions", fileType: "json", objectType: Quiz.self)
        
        self.chosenQuestions = randomizeQuestions(section: section.rawValue)
    }
    
    func returnQuestion() -> Questions {
        
        return quiz[section.rawValue].questions[questionNumber]
    }
    
    func increaseQuestionNum() {
        
        if questionNumber < quiz[section.rawValue].questions.count - 1 {
            questionNumber += 1
        }
    }
    
    func checkAnswer(selectedIndex: Int, currentQuestion:Questions) -> String {
        let selectedAnswer = currentQuestion.answers[selectedIndex]
            return selectedAnswer.correct ? "Correct" : "Wrong"
    }
    
}
