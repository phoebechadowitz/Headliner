import SwiftUI
import SwiftData

struct NewsTabBar: View {
    
    var body: some View {
        TabView{
            NavigationStack {
                HeadlinesList(headlinesLoader: HeadlineLoader(apiClient: NewsAPIClient()))
            }
            .tabItem { Label("Top Headlines", systemImage: "newspaper") }
            NavigationStack {
               SearchList(searchLoader: SearchLoader(apiClient: NewsAPIClient()))
            }
            .tabItem { Label("Search", systemImage: "magnifyingglass") }
            NavigationStack {
                ReadingList()
            }
            .tabItem {Label("Reading List", systemImage: "book")}
        }
    }
}

#Preview {
    NewsTabBar()
        .modelContainer(ModelData.preview)
}
