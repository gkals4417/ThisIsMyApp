//
//  MovieList_SwiftUI_PulsarApp.swift
//  MovieList_SwiftUI_Pulsar
//
//  Created by Hamin Jeong on 2023/03/08.
//

import SwiftUI

@main
struct MovieList_SwiftUI_PulsarApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
