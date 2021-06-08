//
//  HomeView.swift
//  bookmark
//
//  Created by Megan on 5/22/21.
//

import SwiftUI

struct HomeView: View {
    // contains book results
    @ObservedObject var networkManager: NetworkManager
    var savedBooks : FetchedResults<BookData>
    @Binding var currentIndex: Int
    
    @Environment(\.managedObjectContext) private var viewContext
    private func test(_ x: Int) {
        print(x)
    }
    
    var body: some View {
        if networkManager.loading {
            Text("Loading ...")
        } else {
            VStack {
                GeometryReader { geometry in
                    ScrollView {
                        VStack {
                            ZStack {
                                ForEach(0..<networkManager.books.results.count) { i in
                                    // show only top card
                                    if (i == currentIndex) {
                                        CardView(id: i, book: networkManager.books.results[i], onRemove: { id, book, swipedRight in
                                            currentIndex -= 1
                                            if (swipedRight) {
                                                let bookDataItem = BookData(context: viewContext)
                                                let bookItem = BookItem(context: viewContext)
                                                let ISBN = ISBNItem(context: viewContext)
                                                let rankHistory = RankHistoryItem(context: viewContext)
                                                
                                                rankHistory.published_date = book.ranks_history.count > 0 ? book.ranks_history[0].published_date : ""
                                                rankHistory.list_name = book.ranks_history.count > 0 ? book.ranks_history[0].list_name : ""
                                                ISBN.isbn10 = book.isbns.count > 0 ? book.isbns[0].isbn10 : ""
                                                ISBN.isbn13 = book.isbns.count > 0 ? book.isbns[0].isbn13 : ""
                                                
                                                bookItem.title = book.title
                                                bookItem.desc = book.description
                                                bookItem.author = book.author
                                                bookItem.publisher = book.publisher
                                                bookItem.isbns = ISBN
                                                bookItem.ranks_history = rankHistory
                                                
                                                bookDataItem.read = 0
                                                bookDataItem.book = bookItem
                                                do {
                                                    try viewContext.save()
                                                } catch {
                                                    print("error saving book")
                                                }
                                            }
                                            
                                            if (currentIndex == -1 && networkManager.hasNext()) {
                                                networkManager.next()
                                                currentIndex = 19
                                            }
                                        })
                                        .animation(.spring())
                                        .frame(width: geometry.size.width, height: geometry.size.height * 0.80)
                                        .offset(x: 0, y: 20)
                                        
                                    }
                                }
                            }
                            Spacer()
                                .frame(height: 20)
                            // todo: this clearly
                            HStack {
                                VStack {
                                    Image(systemName: "arrow.left")
                                        .foregroundColor(Color.init(red: 0.68, green: 0.12, blue: 0.07))
                                        .padding()
                                    
                                    Text("No, thanks")
                                        .foregroundColor(Color.init(red: 0.68, green: 0.12, blue: 0.07))
                                }
                                Spacer()
                                Image(systemName: "chevron.down")
                                Spacer()
                                VStack {
                                    Image(systemName: "arrow.right")
                                        .foregroundColor(Color.init(red: 0.03, green: 0.57, blue: 0.58))
                                        .padding()
                                    Text("Add to my list!")
                                        .foregroundColor(Color.init(red: 0.03, green: 0.57, blue: 0.58))
                                }
                            }
                            
                        }
                        Spacer()

                        VStack {
                            if (currentIndex != -1) {
                                Text("GENRES")
                                    .font(.headline).bold()
                                    .underline()
                                Spacer()
                                    .frame(height: 30)
                                Text(networkManager.books.results[currentIndex].ranks_history.count > 0 ? networkManager.books.results[currentIndex].ranks_history[0].list_name : "none")
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 16)
                                            .fill(Color.init(red: 0.91, green: 0.84, blue: 0.65)))
                                    .foregroundColor(Color.black)
                                Spacer()
                                    .frame(height: 50)
                                Text("SYNOPSIS")
                                    .font(.headline).bold()
                                    .underline()
                                Spacer()
                                    .frame(height: 30)
                                Text(networkManager.books.results[currentIndex].description ?? "")
                            }
                        }
                    }
                }
            }.padding()
        }
    }
}
