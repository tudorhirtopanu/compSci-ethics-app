//
//  IntellectualPropertyManager.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 21/11/2023.
//

import Foundation

class IntellectualPropertyManager: ObservableObject {
    
    @Published var intellectualPropertyData = [IntellectualPropertyData]()
    
    init(){
        self.intellectualPropertyData = DataService.getLocalData()
    }
    
}
