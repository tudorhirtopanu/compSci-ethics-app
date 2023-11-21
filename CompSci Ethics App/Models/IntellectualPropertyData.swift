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
    var purpose:[String]
    var protectionOverview:[ProtectionOverview]
    var typesOfProtection:[TypesOfProtection]
}

class ProtectionOverview: Identifiable, Decodable {
    var id:Int
    var name:String
    var protects:[String]
    var examples:[String]?
}

class TypesOfProtection: Identifiable, Decodable {
    var id:Int
    var name:String
}
