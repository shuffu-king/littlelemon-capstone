//
//  Little_LemonApp.swift
//  Little Lemon
//
//  Created by Ayo Shafau on 4/10/24.
//

import SwiftUI

@main
struct Little_LemonApp: App {
    let persistantController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            OnboardView().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
        }
    }
}
