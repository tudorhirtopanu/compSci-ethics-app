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
    
    @Published var subjectCorrectAnswers:[[String:Int]] = []
    @Published var subjectTotalQuestions:[[String:Int]] = []
    
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
    
    func checkAnswer(selectedIndex: Int, currentQuestion:Questions) -> Bool {
        let selectedAnswer = currentQuestion.answers[selectedIndex]
            return selectedAnswer.correct 
    }
    
    func clearDictionary() {
        subjectCorrectAnswers.removeAll()
        subjectTotalQuestions.removeAll()
    }
    
    func createArrayOfSectionDictionaries(questions:[Questions], dictionaryArray:inout [[String:Int]]) {
        for q in questions {
            
            let key = q.subjectTag
            
            while(dictionaryArray.contains { $0.keys.contains(key) } == false){
                let key = q.subjectTag
                    dictionaryArray.append([key: 0])
                }
            }
    }
    
    func increaseNumberForKey(_ key: String, dictionaryArray:inout [[String:Int]]) {
        if let index = dictionaryArray.firstIndex(where: { $0.keys.contains(key) }) {
            
            // If the key is found in tempDictionaries
            var dictionary = dictionaryArray[index]
            
            // Update the value associated with the key
            if let currentValue = dictionary[key] {
                dictionary[key] = currentValue + 1
            } else {
                // If the key exists but doesn't have a value, set it to 1
                dictionary[key] = 1
            }
            
            // Update the array at the found index
            dictionaryArray[index] = dictionary
        } else {
            // If the key is not found, add a new entry with the key and value 1
            dictionaryArray.append([key: 1])
        }
    }
    
}
