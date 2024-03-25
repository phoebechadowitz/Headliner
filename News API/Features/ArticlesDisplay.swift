//
//  ArticlesDisplay.swift
//  News API
//
//  Created by Phoebe Chadowitz on 2/24/24.
//

import SwiftUI
import SwiftData

struct ArticlesDisplay: View {
    let news: NewsResponse
    @Environment(\.modelContext) private var modelContext
    
    
    var body: some View {
        let articles = news.articles
        List(articles) { article in
            VStack {
                if let photoURL = article.urlToImage {
                    if let photoURL = URL(string: photoURL) {
                        AsyncImage(url: photoURL) {image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    placeholder: {
                        if photoURL != URL(string: "") {
                            ProgressView()
                        }
                    }
                    }
                }
                if let title = article.title {
                    Text(title)
                        .font(.headline)
                }
                if let description = article.description {
                    Text(description)
                        .font(.caption)
                        .italic()
                }
                VStack {
                    Link(destination: URL(string: article.url)!) {
                        Text("Open article")
                    }
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 4).fill(.blue).frame(width: 340, height: 25)
                    )
                    .buttonStyle(.plain)
                }
                VStack {
                    Button("Add to reading list") {
                        SavedNews.create(article: article, context: modelContext)
                    }
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 4).fill(.teal).frame(width: 340, height: 25)
                    )
                    .buttonStyle(.plain)
                }
            }
        }
    }
}


#Preview {
    ArticlesDisplay(news: NewsResponse.mock())
}
