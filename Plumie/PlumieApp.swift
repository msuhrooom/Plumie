//
//  PlumieApp.swift
//  Plumie
//
//  Created by Danbin Luo on 21/02/2025.
//

import SwiftUI

@main
struct PlumieApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HexagramView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
