//
//  FreedomApp.swift
//  Freedom
//
//  Created by BeastMode on 12/3/24.
//

import SwiftUI

@main
struct FreedomApp: App {
    
    init(){
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
        
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.blue]
        
        UINavigationBar.appearance().prefersLargeTitles = true
        UINavigationBar.appearance().isTranslucent = true
    }
        
    var body: some Scene {
        WindowGroup {
            BabySteps()
        }
    }
}
