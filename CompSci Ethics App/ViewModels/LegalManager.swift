//
//  LegalManager.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 23/11/2023.
//

import Foundation

class LegalManager:ObservableObject {
    
    @Published var legalData = [LegalData]()
    
    init(){
        self.legalData = DataService.getLocalData(fileName: "Legal", fileType: "json", objectType: LegalData.self)
    }
    
}
