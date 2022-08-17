//
//  netflix_cloneApp.swift
//  netflix clone
//
//  Created by Emmanuel Dicksson on 16/08/2022.
//

import SwiftUI

@main
struct netflix_cloneApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
