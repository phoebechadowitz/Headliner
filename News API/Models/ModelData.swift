import Foundation
import SwiftData
import UIKit

class ModelData {
    
    static func startingData(modelContext: ModelContext) {
        let news1 = SavedNews(headline: "someone died", link: "google.com")
        let news2 = SavedNews(headline: "crazy person bites ear", link: "yahoo.com")
        modelContext.insert(news1)
        modelContext.insert(news2)
    }
    
    @MainActor
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: SavedNews.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        ModelData.startingData(modelContext: container.mainContext)
        return container
    }
}
