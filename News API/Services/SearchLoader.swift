import Foundation
import SwiftUI

@Observable
class SearchLoader {
    let apiClient: NewsAPI
    private(set) var state: LoadingState = .idle
    
    enum LoadingState {
        case idle
        case loading
        case success(data: NewsResponse)
        case failed(error: Error)
    }
    
    init(apiClient: NewsAPI) {
      self.apiClient = apiClient
    }
    
    @MainActor
    func loadNewsData(searchKey: String) async {
        self.state = .loading
        do {
            let news = try await apiClient.fetchSearchable(searchKey: searchKey)
            self.state = .success(data: news)
        } catch {
            self.state = .failed(error: error)
        }
    }
}
