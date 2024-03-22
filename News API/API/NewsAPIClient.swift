import CoreLocation

protocol NewsAPI {
    func fetchTopHeadlines() async throws -> NewsResponse
    func fetchSearchable(searchKey: String) async throws -> NewsResponse
}

struct NewsAPIClient: NewsAPI, APIClient {
    var session: URLSession = .shared
    
    func fetchTopHeadlines() async throws -> NewsResponse {
        let path = OpenNewsEndpoint.path(queryType: .topHeadlines)
        let response: NewsResponse = try await performRequest(url: path)
        dump(path)
        return response
    }
    func fetchSearchable(searchKey: String) async throws -> NewsResponse {
        let path = OpenNewsEndpoint.path(queryType: .everything(searchKey: searchKey))
        let response: NewsResponse = try await performRequest(url: path)
        dump(path)
        return response
    }
}

struct MockNewsAPIClient: NewsAPI {
    func fetchTopHeadlines() async throws -> NewsResponse {
        NewsResponse.mock()
    }
    
    func fetchSearchable(searchKey: String) async throws -> NewsResponse {
        NewsResponse.searchableMock()
    }
}
