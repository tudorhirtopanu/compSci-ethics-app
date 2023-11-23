//
//  NavigationManager.swift
//  CompSci Ethics App
//
//  Created by Tudor Hirtopanu on 23/11/2023.
//

import Foundation
import SwiftUI

class NavigationManager: ObservableObject {
    
    @Published var path = NavigationPath()
    
    func popToRoot() {
        path = NavigationPath()
    }
    
}
