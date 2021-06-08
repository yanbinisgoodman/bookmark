//
//  bookmarkApp.swift
//  bookmark
//
//  Created by Megan on 5/22/21.
//

import SwiftUI

@main
struct bookmarkApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
