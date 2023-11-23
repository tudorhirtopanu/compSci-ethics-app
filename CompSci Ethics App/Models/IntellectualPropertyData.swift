//
//  IntellectualPropertyData.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 21/11/2023.
//

import Foundation

class IntellectualPropertyData: Identifiable, Decodable {
    var id:Int
    var title:String
    var definition:String
    var examples:[String]
    var purposeTitle:String
    var purpose:[String]
    var protectionDescription:String
    var protectionOverview:[ProtectionOverview]
    var typesOfProtection:[TypesOfProtection]
    var copyright:Copyright
    var patents:Patents
}

class ProtectionOverview: Identifiable, Decodable {
    var id:Int
    var name:String
    var protects:[String]
    var examples:String?
}

class TypesOfProtection: Identifiable, Decodable {
    var id:Int
    var name:String
}

class Copyright: Identifiable, Decodable {
    var id:Int
    var title:String
    var description:String
    var covers:[String]
    var copyrightFact:String
    var copyrightFactExamples:[String]
    var license:String
    var softwareLimitation:String
}

class Patents: Identifiable, Decodable {
    var id:Int
    var title:String
    var definition:String
    var patentFacts:[String]
    var boundaries:String
    var boundaryExample:[String]
}
