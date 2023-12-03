//
//  SectionData.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 02/12/2023.
//

import Foundation
import SwiftData

@Model
class ModuleData: Identifiable {
    
    var id:String
    @Attribute(.unique) var name: String
    var totalQuestions:Int
    var sectionTotalQuestions:[[String:Int]]
    var sectionCorrectAnswers:[[String:Int]]
   
//    init(name:String, totalQuestions:Int){
//        id = UUID().uuidString
//        self.name =  name
//        self.totalQuestions = totalQuestions
//    }
    init(name: String, totalQuestions: Int, sectionTotalQuestions: [[String : Int]], sectionCorrectAnswers: [[String : Int]]) {
        id = UUID().uuidString
        self.name = name
        self.totalQuestions = totalQuestions
        self.sectionTotalQuestions = sectionTotalQuestions
        self.sectionCorrectAnswers = sectionCorrectAnswers
    }
    
    static func example() -> ModuleData {
        return ModuleData(name: "Ethics", totalQuestions: 32, sectionTotalQuestions: [["S1":30],["S2":24]], sectionCorrectAnswers: [["S1":20],["S2":18]])
    }
    
}
