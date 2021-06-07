//
//  ReadingListView.swift
//  bookmark
//
//  Created by Elizabeth 6/4/21
//

import SwiftUI
import UIKit

struct ReadingListView: View {
    @Binding var savedBooks: [Book]
    @State var view: String = "list"
//    var count: Int
//
//    init(savedBooks: Binding<[Book]>) {
//        self._savedBooks = savedBooks
//        view = "list"
//        count = self.savedBooks.count
//    }
    
    private func onDelete(_ index: Int) -> Void {
        print(index)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Reading List")
                    .font(.headline)
                Button(action: {
                    view = view == "list" ? "gallery" : "list"
                }, label: {
                    Text("\(view == "list" ? "gallery" : "list") view")
                })
                
                if (view == "list") {
                    // OPTION 1: list view
                    ListView(books: savedBooks)
                    
                } else {
                    // OPTION 2: gallery view
                    GalleryView(books: savedBooks)
                }
                Spacer()
            }
        }
    }
}

struct ListView: View {
    @State var books: [Book]

    var body: some View {
        List {
            ForEach(0..<books.count, id: \.self) { i in
                NavigationLink(destination: DetailsView(id: i, book: books[i], onDelete: { id in
                    books.remove(at: id)
                    print(books)
                })) {
                    VStack(alignment: .leading) {
                        Text(books[i].title)
                            .fontWeight(.semibold)
                        Text(books[i].author)
                            .font(.subheadline)
                            .foregroundColor(Color.gray)
                    }
                }
            }
        }
    }
}

struct GalleryView: View {
    @State var books: [Book]

    var body: some View {
        ScrollView {
            ForEach(Array(stride(from: 0, to: books.count, by: 2)), id: \.self) { i in
                // TODO: fix sizing for odd number of books in list (last one takes up whole width)
                HStack() {
                    NavigationLink(destination: DetailsView(id: i, book: books[i], onDelete: { id in
                        books.remove(at: id)
                        print(books)
                    })) {
                        BookView(id: i, book: books[i])
                    }
                    
                    if (i + 1 < books.count) {
                        NavigationLink(destination: DetailsView(id: i + 1, book: books[i + 1], onDelete: { id in
                            books.remove(at: id)
                            print(books)
                        })) {
                            BookView(id: i + 1, book: books[i + 1])
                        }
                    }
                }
                .frame(height: 150.0)
            }
        }
    }
}
