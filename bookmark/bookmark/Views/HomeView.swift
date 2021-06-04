//
//  HomeView.swift
//  bookmark
//
//  Created by Megan on 5/22/21.
//

import SwiftUI

struct HomeView: View {
    // contains book results
    @ObservedObject var networkManager = NetworkManager()
    @State var removedIndices: [Int] = []
    @State var bookList: [Book] = []
    @State var currentIndex: Int = 19
    
    //    init() {
    //        books = networkManager.books.results
    //    }
    
    // Return the CardView's width given its offset in the array
    // - Parameters:
    //   - geometry: The geometry proxy of the parent
    //   - id: The ID of the current card
    private func getCardWidth(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        let books = networkManager.books.results
        let offset: CGFloat = CGFloat(books.count - removedIndices.count - 1 - id) * 20
        return geometry.size.width - offset
    }
    
    // Return the CardView's frame offset given its offset in the array
    // - Parameters:
    //   - geometry: The geometry proxy of the parent
    //   - id: The ID of the current user
    private func getCardOffset(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        let books = networkManager.books.results
        return  CGFloat(books.count - removedIndices.count - 1 - id) * 20
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
                                    // show only top four cards
                                    //                                        if (i > networkManager.books.results.count - removedIndices.count - 5                                             && !removedIndices.contains(i)) {
                                    // show only top card
                                    if (i == networkManager.books.results.count - removedIndices.count - 1 && !removedIndices.contains(i)) {
                                        CardView(id: i, book: networkManager.books.results[i], onRemove: { id, book, swipedRight in
                                            removedIndices.append(id)
                                            currentIndex -= 1
                                            if (swipedRight) {
                                                bookList.append(book)
                                            }
                                            
                                            // load next
                                            if (removedIndices.count == 20 && networkManager.hasNext()) {
                                                removedIndices.removeAll()
                                                networkManager.next()
                                                currentIndex = 19
                                                print(removedIndices)
                                                print(networkManager.books.results)
                                            }
                                        })
                                        .animation(.spring())
                                        .frame(width: self.getCardWidth(geometry, id: i),
                                               height: 600)
                                        .offset(x: 0, y: self.getCardOffset(geometry, id: i))
                                        
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
                        // DetailsView(book: networkManager.books.results[cur])
                        // todo: add more info
                        // todo: position so this isnt visible until scroll
                        VStack {
                            
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
                            
                            //                            Spacer()
                            //                                .frame(height: 50)
                            //                            Text("AUTHOR")
                            //                                .font(.headline).bold()
                            //                                .underline()
                            //                            Spacer()
                            //                                .frame(height: 30)
                            //                            Text(networkManager.books.results[currentIndex].author)
                            //                            Spacer()
                            //                                .frame(height: 50)
                            //
                            //                            }
                            
                        }
                    }
                }
            }.padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
