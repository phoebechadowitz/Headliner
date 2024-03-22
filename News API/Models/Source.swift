import Foundation

struct Source: Decodable {
    var id: String?
    var name: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
