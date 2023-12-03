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
   
    init(name:String, totalQuestions:Int){
        id = UUID().uuidString
        self.name =  name
        self.totalQuestions = totalQuestions
    }
    
    static func example() -> ModuleData {
        return ModuleData(name: "Ethics", totalQuestions: 32)
    }
    
}
