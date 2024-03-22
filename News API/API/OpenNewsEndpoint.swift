import Foundation
import CoreLocation

struct OpenNewsEndpoint {
    static let baseUrl = "https://newsapi.org/v2"
    static let apiKey = "396b9413f06c4726b001edf6ba1102ec"
    
    enum QueryType {
        case everything(searchKey: String)
        case topHeadlines
        
        var queryName: String {
            switch self {
            case .everything: return "everything"
            case .topHeadlines: return "top-headlines"
            }
        }
    }
    
    
    
    static func path(queryType: QueryType) -> String {
        var url = "\(baseUrl)/\(queryType.queryName)?"
        let country = "country=us"
        switch queryType {
        case .everything(let searchKey):
            url.append("q=\(searchKey)")
        case .topHeadlines:
            url.append(country)
        }
        let returnString = "\(url)&apiKey=\(apiKey)"
        return returnString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "Error in encoding"
    }
}
