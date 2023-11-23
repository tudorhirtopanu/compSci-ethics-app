//
//  LegalData.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 23/11/2023.
//

import Foundation

class LegalData:Identifiable, Decodable {
    var id:Int
    var title:String
    var softwareCrimes:SoftwareCrimes
    var compMisuseAct:CompMisuseAct
    var compMisuseActAmendments:CompMisuseActAmendments
    var privacy:Privacy
    var dataProtectionLegislation:DataProtectionLegislation
    var dpa1998:DPA1998
    var gdpr:GDPR
    var dataSecurity:DataSecurity
    var securityThreats:SecurityThreats
    var reducingRisks:ReducingRisks
    var risksSummary:RisksSummary
}

class SoftwareCrimes:Identifiable, Decodable {
    var id:Int
    var chapter:String
    var title:String
    var softwareCrimeTypes:[SoftwareCrimeTypes]
}

class SoftwareCrimeTypes:Identifiable, Decodable {
    var id:Int
    var name:String
    var definition:[String]
    var examples:[String]?
}

class CompMisuseAct: Identifiable, Decodable {
    var id:Int
    var title:String
    var chapter:String
    var description:String
    var origin:String
    var actSections:[ActSections]
    
}

class ActSections: Identifiable, Decodable {
    var id:Int
    var title:String
    var description:String
    var explanation:String
}

class CompMisuseActAmendments:Identifiable, Decodable {
    var id:Int
    var title:String
    var chapter:String
    var description:String
    var amendmentTitle:String
    var amendmentDescription:[String]
}

class Privacy:Identifiable, Decodable {
    var id:Int
    var title:String
    var chapter:String
    var definition:String
    var privacyTemp:String
    var dataIssues:[String]
    var solution:String
}

class DataProtectionLegislation:Identifiable, Decodable {
    var id:Int
    var title:String
    var chapter:String
    var description:[String]
}

class DPA1998:Identifiable, Decodable {
    var id:Int
    var title:String
    var chapter:String
    var description:String
    var keyPrinciples:[String]
    var dpaAppliesToDataHeldOn:[String]
    var dataStoringExamples:[String]
    var subjectRights1994:String
    var subjectRights1998:[String]
}

class GDPR:Identifiable, Decodable {
    var id:Int
    var title:String
    var chapter:String
    var description:[String]
    var gdprApplications:gdprApplications
    var subTitle:String
    var gdprAppliesTo:[gdprAppliesTo]
    var exceptions:String
    var subTitle2:String
    var personalDataPrinciples:[String]
}

class gdprApplications:Identifiable, Decodable {
    var id:Int
    var title:String
    var shortDescr:String
    var appliesTo:[String]
    var secondShortDescr:String
    var doesntApplyTo:[String]
}

class gdprAppliesTo:Identifiable, Decodable {
    var id:Int
    var name:String
    var examples:[String]
}

class DataSecurity:Identifiable, Decodable {
    var id:Int
    var title:String
    var chapter:String
    var definition:String
    var breachExamples:[String]
    var breachImpacts:[String]
    var riskResponsibility:String
    var bcsLink:[BCSLink]
    var dpaLink:DPALink
}

class BCSLink:Identifiable, Decodable {
    var id:Int
    var codeName:String
    var explanation:String
}

class DPALink: Identifiable, Decodable {
    var id:Int
    var name:String
    var description:String
    var importantNote:String
}

class SecurityThreats: Identifiable, Decodable {
    var id:Int
    var title:String
    var chapter:String
    var threats:[Threats]
}

class Threats: Identifiable, Decodable {
    var id:Int
    var name:String
    var examples:[String]
}

class ReducingRisks: Identifiable, Decodable {
    var id:Int
    var title:String
    var chapter:String
    var riskReduction:[RiskReduction]
}

class RiskReduction: Identifiable, Decodable {
    var id:Int
    var name:String
    var description:[String]
    var extraInfo:[String]?
}

class RisksSummary: Identifiable, Decodable {
    var id:Int
    var title:String
    var chapter:String
    var description:String
    var stepsToSecure:[String]
}
