//
//  News_APIApp.swift
//  News API
//
//  Created by Phoebe Chadowitz on 2/23/24.
//

import SwiftUI
import SwiftData

@main
struct News_APIApp: App {
    var sharedModelContainer: ModelContainer = {
      let schema = Schema([
        SavedNews.self
      ])
      let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
      
      do {
        return try ModelContainer(for: schema, configurations: [modelConfiguration])
      } catch {
        fatalError("Could not create ModelContainer: \(error)")
      }
    }()

    
    var body: some Scene {
        WindowGroup {
            NewsTabBar()
        }
        .modelContainer(sharedModelContainer)
    }
}
