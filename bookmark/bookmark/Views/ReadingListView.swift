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
    @State var showList = true
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Reading List")
                    .font(.headline)
                    .foregroundColor(Color.init(red: 0.03, green: 0.57, blue: 0.58))
                Toggle("Gallery/List View", isOn: $showList)
                    .font(.subheadline)
                    .toggleStyle(SwitchToggleStyle(tint: Color.init(red: 0.03, green: 0.57, blue: 0.58)))
                    .foregroundColor(Color.init(red: 0.03, green: 0.57, blue: 0.58))
//                Button(action: {
//                    view = view == "list" ? "gallery" : "list"
//                }, label: {
//                    Text("\(view == "list" ? "gallery" : "list") view")
//                })
                
                if (view == "list" && showList) {
                    // OPTION 1: list view
                    ListView(books: $savedBooks)
                    
                } else {
                    // OPTION 2: gallery view
                    GalleryView(books: $savedBooks)
                }
                Spacer()
            }
        }
    }
}

struct ListView: View {
    @Binding var books: [Book]

    var body: some View {
        List {
            ForEach(0..<books.count, id: \.self) { i in
                NavigationLink(destination: DetailsView(id: i, book: books[i], onDelete: { id in
                    books.remove(at: id)
                    print(books)
                })) {
                    VStack(alignment: .leading, spacing: 5) {
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
    @Binding var books: [Book]

    var body: some View {
        ScrollView {
            ForEach(Array(stride(from: 0, to: books.count - (books.count % 2), by: 2)), id: \.self) { i in
                // TODO: fix sizing for odd number of books in list (last one takes up whole width)
                HStack(spacing: 5) {
                    NavigationLink(destination: DetailsView(id: i, book: books[i], onDelete: { id in
                        books.remove(at: id)
                        print(books)
                    })) {
                        BookView(id: i, book: books[i])
                        Spacer()
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
            
            if (books.count % 2 == 1) {
 
                HStack(spacing: 5) {
                    NavigationLink(destination: DetailsView(id: books.count - (books.count % 2), book: books[books.count - (books.count % 2)], onDelete: { id in
                        books.remove(at: id)
                        print(books)
                    })) {
                        BookView(id: books.count - (books.count % 2), book: books[books.count - (books.count % 2)])
                        Spacer()
                    }
//                     {
                        BookView(id: -1, book: books[books.count - (books.count % 2)])
//                    }
                }
                .frame(height: 150.0)
            }
        }
    }
}
