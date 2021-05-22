//
//  ContentView.swift
//  bookmark
//
//  Created by Megan on 5/22/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    init()  {
//        print(networkManager.books)
    }
    var body: some View {
        NavigationView {
//            List($networkManager.books.results.identified(by: \<#Root#>.id)) { movie in
//                Text("\(movie.title)")
////              NavigationLink(destination: MovieDetails(movie: movie)){
////                    MovieRow(movie: movie)
//
////                }
//            }
            if networkManager.loading {
                                Text("Loading ...")
                            } else {
                                List(networkManager.movies.results, id: \.title) { quiz in
                                    Text(quiz.title)
                                }
                            }
            
            //3.
//            List(comments) { comment in
//                VStack(alignment: .leading) {
//                    Text(comment.name)
//                        .font(.title)
//                        .fontWeight(.bold)
//                    Text(comment.email)
//                        .font(.subheadline)
//                        .fontWeight(.bold)
//                    Text(comment.body)
//                        .font(.body)
//                }
                
//        }
//        //2.
//        .onAppear() {
////            apiCall().getUserComments { (comments) in
////                self.comments = comments
////            }
//        }.navigationTitle("Comments")
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
