//
//  ReadingList.swift
//  News API
//
//  Created by Phoebe Chadowitz on 3/22/24.
//

import SwiftUI
import SwiftData

struct ReadingList: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var savedNews: [SavedNews]
    var body: some View {
        List(savedNews) { article in
            Link(destination: URL(string: article.link)!) {
                Text(article.headline)
                    .font(.title3)
            }
            .swipeActions(edge: .trailing) {
                Button("Delete", systemImage: "trash") {
                    modelContext.delete(article)
                }
                .tint(.red)
    
            }
        }
    }
}

#Preview {
    ReadingList()
        .modelContainer(ModelData.preview)
}
