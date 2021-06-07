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
    @Binding var savedBooks: [Book]    
    @Binding var currentIndex: Int
    
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
                                                savedBooks.append(book)
                                            }
                                            
                                            // load next set of books
//                                            print(removedIndices.count)
//                                            print(networkManager.hasNext())
                                            if (currentIndex == -1 && networkManager.hasNext()) {
                                                networkManager.next()
                                                currentIndex = 19
//                                                print(removeSBdIndices)
//                                                print(networkManager.books.results)
                                            }
//                                            print(savedBooks)
//                                            print(removedIndices)
//                                            print(currentIndex)
                                            
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
                        // DetailsView(book: networkManager.books.results[cur])
                        // todo: add more info
                        // todo: position so this isnt visible until scroll
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

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
