//
//  CompSci_Ethics_AppApp.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 20/11/2023.
//

import SwiftUI
import SwiftData

@main
struct CompSci_Ethics_App: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }.modelContainer(for: ModuleData.self)
    }
}
