//
//  ReadingListView.swift
//  bookmark
//
//  Created by Megan on 5/25/21.
//

import SwiftUI
import UIKit


struct ReadingListView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        if networkManager.loading {
            Text("Loading ...")
        } else {
            NavigationView {
                VStack {
                    Text("Your Reading List")
                        .font(.headline)
                    
                    NavigationLink(destination: ListView()) {
                        Text("View List")
                    }
                    
                    ZStack {
                        HStack {
                            List {
                                ForEach(0..<networkManager.books.results.count/2) { i in
                                    BookView(id: i, book: networkManager.books.results[i])
                                }
                            }
                            
                            List {
                                ForEach(networkManager.books.results.count/2..<networkManager.books.results.count) { i in
                                    BookView(id: i, book: networkManager.books.results[i])
                                }
                            }
                            
                        }
                    }
                }
            }
            
        }
        
        
//        NavigationView {
//            List {
//                NavigationLink(destination: ListView()) {
//                    Text("View List")
//                }
//            }
//            .navigationBarTitle(Text("View Books"))
//        }
        
//        if networkManager.loading {
//            Text("Loading ...")
//        } else {
//            // OPTION 2: Get all books view
//            ZStack {
//                HStack {
//                    List {
//                        ForEach(0..<networkManager.books.results.count/2) { i in
//                            BookView(id: i, book: networkManager.books.results[i])
//                        }
//                    }
//                    List {
//                        ForEach(networkManager.books.results.count/2..<networkManager.books.results.count) { i in
//                            BookView(id: i, book: networkManager.books.results[i])
//                        }
//                    }
//                }
//            }
//        }
        
        
//        if networkManager.loading {
//            Text("Loading ...")
//        } else {
//            // OPTION 2: Get all books view
//            ZStack {
//                HStack {
//                    List {
//                        ForEach(0..<networkManager.books.results.count/2) { i in
//                            BookView(id: i, book: networkManager.books.results[i])
//                        }
//                    }
//                    List {
//                        ForEach(networkManager.books.results.count/2..<networkManager.books.results.count) { i in
//                            BookView(id: i, book: networkManager.books.results[i])
//                        }
//                    }
//                }
//            }
//        }
        
    }
}

struct ListView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        if networkManager.loading {
            Text("Loading ...")
        } else {
            // OPTION 1: Get list of books
            VStack {
                Text("Reading List")
                List(networkManager.books.results, id: \.title) { book in
                    VStack(alignment: .leading) {
                        Text(book.title)
                            .fontWeight(.semibold)
                        Text(book.author)
                            .font(.subheadline)
                            .foregroundColor(Color.gray)
                    }
                }
            }
        }
    }
}






struct ReadingListView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingListView()
    }
}



//        let url = URL(string: "http://i.imgur.com/w5rkSIj.jpg")!
//        let data = try? Data(contentsOf: url)
//        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
//
//        if let imageData = data {
//            imageView = UIImage(data: imageData)
//        }
//
//        var imageView : UIImageView
//        imageView  = UIImageView(frame:CGRect(x:10, y:50, width:100, height:300));
//        imageView.image = UIImage(named:"Test.jpeg")
//        self.view.addSubview(imageView)
//
