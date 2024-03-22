import Foundation

struct Article: Identifiable, Decodable {
    let id: UUID = UUID()
    var source: Source
    var author: String?
    var title: String?
    var description: String?
    var url: String
    var urlToImage: String?
    var publishedAt: String
    var content: String?
    
    private enum CodingKeys: String, CodingKey {
        case source
        case author
        case title
        case description
        case url
        case urlToImage
        case publishedAt
        case content
    }

}
