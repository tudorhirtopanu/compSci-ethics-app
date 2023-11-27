//
//  EthicsManager.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 27/11/2023.
//

import Foundation

class EthicsManager:ObservableObject {
    
    @Published var ethicsData = [EthicsData]()
    
    init(){
        self.ethicsData = DataService.getLocalData(fileName: "Ethics", fileType: "json", objectType: EthicsData.self)
    }
    
}
