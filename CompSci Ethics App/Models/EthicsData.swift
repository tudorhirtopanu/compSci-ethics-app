//
//  EthicsData.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 27/11/2023.
//

import Foundation

class EthicsData: Identifiable, Decodable {
    var id:Int
    var title:String
    var ethicalBehaviour:EthicalBehaviour
    var ethicsVsLegal:EthicalVsLegal
    var professionalEthics: ProfessionalEthics
    var brunelEthics:BrunelEthics
}

class EthicalBehaviour:Identifiable, Decodable {
    var id:Int
    var chapter:String
    var title:String
    var definition:[String]
    var conflicts:[String]
    var shortDescription:String
    var computerEthics:ComputerEthics
}

class ComputerEthics :Identifiable, Decodable {
    var id:Int
    var title:String
    var description:[String]
    var example:String
}

class EthicalVsLegal : Identifiable, Decodable {
    var id:Int
    var chapter:String
    var title:String
    var description:[String]
}

class ProfessionalEthics : Identifiable, Decodable {
    var id:Int
    var chapter:String
    var title:String
    var description:[String]
    var codeOfConductSections:[CodeOfConductSections]
}

class CodeOfConductSections : Identifiable, Decodable {
    var id:Int
    var title:String
    var subtitle:String
    var description:String
}

class BrunelEthics : Identifiable, Decodable {
    var id:Int
    var chapter:String
    var title:String
    var description:String
    var guidelinesToFollow:[GuidelinesToFollow]
}

class GuidelinesToFollow: Identifiable, Decodable {
    var id:Int
    var title:String
    var description:[String]
}
