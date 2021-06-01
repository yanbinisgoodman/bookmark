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
                                                     height: 400)
                                            .offset(x: 0, y: self.getCardOffset(geometry, id: i))
                                        }
                                    }
                                }
                                Spacer()
                                // todo: this clearly
                                HStack {
                                    Text("swipe left")
                                    Spacer()
                                    Text("swipe down")
                                    Spacer()
                                    Text("swipe right")
                                }
                            }
                            // todo: add more info
                            // todo: position so this isnt visible until scroll
                            VStack {
                                Text(networkManager.books.results[currentIndex].title)
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
