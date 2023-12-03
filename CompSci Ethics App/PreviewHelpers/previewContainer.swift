//
//  previewContainer.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 03/12/2023.
//

import Foundation
import SwiftData

let previewContainer: ModelContainer = {
    
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: ModuleData.self, configurations: config)
        
        Task { @MainActor in
            
            let context = container.mainContext
            
            let dataItem = ModuleData.example()
            context.insert(dataItem)
            
        }
        return container
    }
    catch {
       fatalError("Failed to create container")
    }
    
}()
