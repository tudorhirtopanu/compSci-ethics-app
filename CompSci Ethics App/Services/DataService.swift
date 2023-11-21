//
//  DataService.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 21/11/2023.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [IntellectualPropertyData] {
        
        // Parse local json file
        
        // Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "IntellectualProperty", ofType: "json")
        
        // Check if pathString is not nil, otherwise...
        guard pathString != nil else {
            return [IntellectualPropertyData]()
        }
        
        // Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do {
                
                let recipeData = try decoder.decode([IntellectualPropertyData].self, from: data)
                
                // Return the recipes
                return recipeData
                
            }
            catch {
                // error with parsing json
                print(error)
            }

        }
        catch {
            //error  with getting data
            print(error)
        }
        
        return [IntellectualPropertyData]()
    }
    
}
