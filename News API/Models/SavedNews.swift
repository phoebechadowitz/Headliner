import Foundation
import SwiftData

@Model

class SavedNews {
    
    var headline: String
    var link: String
    
    init(headline: String, link: String) {
        self.headline = headline
        self.link = link
    }
    
    static func create(article: Article, context: ModelContext) {
        var savedNews: SavedNews
        if let articleTitle = article.title {
            savedNews = SavedNews(headline: articleTitle, link: article.url)

        }
        else {
            savedNews = SavedNews(headline: "", link: article.url)
        }
        context.insert(savedNews)
    }

}
