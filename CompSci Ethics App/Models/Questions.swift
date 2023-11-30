//
//  Questions.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 28/11/2023.
//

import Foundation

class Quiz: Identifiable, Decodable {
    var id: Int
    var title:String
    var questions:[Questions]
}

class Questions: Identifiable, Decodable {
    var id:String
    var text:String
    var answers:[Answers]
    var sectionTag:String
    var subjectTag:String
}

class Answers: Identifiable, Decodable {
    var text:String
    var correct:Bool
}

