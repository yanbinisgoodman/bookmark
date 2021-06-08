//
//  ReadingListView.swift
//  bookmark
//
//  Created by Elizabeth 6/4/21
//

import SwiftUI
import UIKit

struct ReadingListView: View {
    @Binding var savedBooks: [(read: Int, book: Book)]
    @State var username: String
    @State var view: String = "list"
    @State var showList = true
    
    var body: some View {
        NavigationView {
            VStack {
                if (username == "") {
                    Text("reading list")
                        .foregroundColor(Color.init(red: 0.03, green: 0.57, blue: 0.58))
                        .font(Font.custom("Avenir", size: 30)).bold()
                        .fontWeight(.medium)
                } else {
                    Text("\(username.lowercased())'s reading list")
                        .foregroundColor(Color.init(red: 0.03, green: 0.57, blue: 0.58))
                        .font(Font.custom("Avenir", size: 30)).bold()
                        .fontWeight(.medium)
                }
                Toggle("Toggle betweeen Gallery/List View", isOn: $showList)
                    .padding(10)
                    .font(Font.custom("Avenir", size: 15))
                    .toggleStyle(SwitchToggleStyle(tint: Color.init(red: 0.03, green: 0.57, blue: 0.58)))
                    .foregroundColor(Color.init(red: 0.03, green: 0.57, blue: 0.58))

                if (view == "list" && showList) {
                    // OPTION 1: list view
                    ListView(books: $savedBooks)
                    
                } else {
                    // OPTION 2: gallery view
                    GalleryView(books: $savedBooks)
                }
                Spacer()
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            
        }
    }
}

struct ListView: View {
    @Binding var books: [(read: Int, book: Book)]

    var body: some View {
        List {
            ForEach(0..<books.count, id: \.self) { i in
                NavigationLink(destination: DetailsView(id: i, book: books[i], onDelete: { id in
                    books.remove(at: id)
                    print(books)
                }, onRead: { id in
                    print(books)
                    books[id].read = books[id].read == 0 ? 1 : 0
                })) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(books[i].book.title)
                            .font(Font.custom("Avenir", size: 18)).bold()
                            .fontWeight(.medium)
                        Text(books[i].book.author)
                            .foregroundColor(Color.black)
                            .font(Font.custom("Avenir", size: 12))
                    }
                }
            }
        }
    }
}

struct GalleryView: View {
    @Binding var books: [(read: Int, book: Book)]

    var body: some View {
        ScrollView {
            ForEach(Array(stride(from: 0, to: books.count - (books.count % 2), by: 2)), id: \.self) { i in
                HStack {
                    NavigationLink(destination: DetailsView(id: i, book: books[i], onDelete: { id in
                        books.remove(at: id)
                        print(books)
                    }, onRead: { id in
                        print(books)
                        books[id].read = books[id].read == 0 ? 1 : 0
                    })) {
                        BookView(id: i, book: books[i].book)
                        Spacer()
                    }
                    
                    if (i + 1 < books.count) {
                        NavigationLink(destination: DetailsView(id: i + 1, book: books[i + 1], onDelete: { id in
                            books.remove(at: id)
                            print(books)
                        }, onRead: { id in
                            print(books)
                            books[id].read = books[id].read == 0 ? 1 : 0
                        })) {
                            BookView(id: i + 1, book: books[i + 1].book)
                        }
                    }
                }
                .frame(height: 250.0)
            }
            
            if (books.count % 2 == 1) {
                HStack {
                    NavigationLink(destination: DetailsView(id: books.count - (books.count % 2), book: books[books.count - (books.count % 2)], onDelete: { id in
                        books.remove(at: id)
                        print(books)
                    }, onRead: { id in
                        print(books)
                        books[id].read = books[id].read == 0 ? 1 : 0
                    })) {
                        BookView(id: books.count - (books.count % 2), book: books[books.count - (books.count % 2)].book)
                        Spacer()
                    }
                    BookView(id: -1, book: books[books.count - (books.count % 2)].book)
                }
                .frame(height: 250.0)
            }
        }
    }
}
