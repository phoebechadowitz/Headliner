import SwiftUI
import SwiftData

struct SearchList: View {
    let searchLoader: SearchLoader
    @State var searchKey: String = ""
    var body: some View {
        VStack {
            TextFieldWithLabel(label: "", text: $searchKey, prompt: "Enter your search query")
                .padding(.horizontal)
                .onSubmit {
                    Task {
                        await searchLoader.loadNewsData(searchKey: searchKey)
                    }
                }
            
            Button("Search") {
                Task {
                    await searchLoader.loadNewsData(searchKey: searchKey)
                }
            }
            .disabled(searchKey == "" ? true : false)
            .buttonStyle(.borderedProminent)
            switch searchLoader.state {
            case .idle: Color.clear
            case .loading: ProgressView()
            case .failed(let error): Text("Error \(error.localizedDescription)")
            case .success(let news):
                ArticlesDisplay(news: news)
            }
        }
    }
}

#Preview {
    SearchList(searchLoader: SearchLoader(apiClient: MockNewsAPIClient()))
}
