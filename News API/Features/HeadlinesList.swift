import SwiftUI
import SwiftData

struct HeadlinesList: View {
    let headlinesLoader: HeadlineLoader
    var body: some View {
        VStack {
            switch headlinesLoader.state {
            case .idle: Color.clear
            case .loading: ProgressView()
            case .failed(let error): Text("Error \(error.localizedDescription)")
            case .success(let news):
                ArticlesDisplay(news: news)
            }
        }
        .task { await headlinesLoader.loadNewsData() }
    }
}

#Preview {
    HeadlinesList(headlinesLoader: HeadlineLoader(apiClient: MockNewsAPIClient()))
        .modelContainer(ModelData.preview)
}
