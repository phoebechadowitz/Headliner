import Foundation
import CoreLocation

struct NewsResponse: Decodable {
    var status: String
    var totalResults: Int
    var articles: [Article]
    
    private enum CodingKeys: String, CodingKey {
        case status
        case totalResults
        case articles
    }
    
    static func mock() -> NewsResponse {
        let articleOne = Article(source: Source(id: "cnn", name: "CNN"), author: "Rebekah Riess, Caroll Alvarado, Holly Yan", title: "Police ID person of interest in death of Augusta University student found dead on UGA campus - CNN", description: "The body of a woman found dead Thursday on the University of Georgia camus has been identified as 22-year-old Laken Hope Riley, the Athens-Clarke County coroner told CNN on Friday.", url: "https://www.cnn.com/2024/02/23/us/uga-augusta-university-student-death/index.html", urlToImage: "https://media.cnn.com/api/v1/images/stellar/prod/screenshot-2024-02-23-at-10-05-49-am.jpg?c=16x9&q=w_800,c_fill", publishedAt: "2024-02-23T18:23:00Z", content: "University of Georgia Police have identified a person of interest who is being questioned in relation to the on-campus death of 22-year-old Laken Hope Riley on Thursday, a UGA spokesperson said.\r\nWe … [+3231 chars]")
        let articleTwo = Article(source: Source(name: "Prideofdetroit.com"), author: "Jeremy Reisman, Erik Schlitt", title: "2024 NFL salary cap set significantly higher than estimates - Pride Of Detroit", description: "The 2024 NFL salary cap number is higher than expected. Here’s what it means for the Detroit Lions.", url: "https://www.prideofdetroit.com/2024/2/23/24081156/2024-nfl-salary-cap-set-significantly-higher-detroit-lions-cap-room", urlToImage: "https://cdn.vox-cdn.com/thumbor/YYCPUwo7cqEPmAdfv0y1nV1eoW4=/0x0:3600x1885/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/25301017/usa_today_21934724.jpg", publishedAt: "2024-02-23T18:03:21Z", content: "On Friday afternoon, the NFL announced that the salary cap for the 2024 season will be $255.4 million per team. If that sounds like a lot of money, it is. Most estimates figured that number would be … [+1816 chars]")
        return NewsResponse(status: "ok", totalResults: 2, articles: [articleOne, articleTwo])
    }
    
    static func searchableMock() -> NewsResponse {
        return mock()
    }
}
