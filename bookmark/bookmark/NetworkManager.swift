//
//  NetworkManager.swift
//  bookmark
//
//  Created by Megan on 5/22/21.
//

import Foundation
import Combine
import SwiftUI

class NetworkManager: ObservableObject {
    @Published var movies = BookList(results: [])
//    @Published var movies = MovieList(results: [])
    @Published var loading = false
    private let api_key = "dbOUHC2GNZmbnGRzwbws2F3syLE7Wtge"
    private let api_url_base = "https://api.nytimes.com/svc/books/v3/lists/best-sellers/history.json?"
    private let offset = 0
//    private let api_key = "2c4c45f10e8c9bcb289e93874fce1a4b"
//    private let api_url_base = "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key="

    init() {
        loading = true
        loadDataNormal()
    }
    
    private func loadDataNormal() {
        guard let url = URL(string: "\(api_url_base)offset=\(offset)&api-key=\(api_key)") else { return }
        URLSession.shared.dataTask(with: url){ (data, _, _) in

            guard let data = data else { return }
            print(data)
            let movies = try! JSONDecoder().decode(BookList.self, from: data)
            DispatchQueue.main.async {
                self.movies = movies
                self.loading = false
                print(self.movies)
            }
        }.resume()
    }
    
//    private func loadDataNormal() {
//        guard let url = URL(string: "\(api_url_base)\(api_key)") else { return }
//        URLSession.shared.dataTask(with: url){ (data, _, _) in
//
//            guard let data = data else { return }
//            print(data)
//            let movies = try! JSONDecoder().decode(MovieList.self, from: data)
//            DispatchQueue.main.async {
//                self.movies = movies
//                self.loading = false
//                print(self.movies)
//            }
//        }.resume()
//    }

//    init() {
//        guard let url = URL(string: "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=2c4c45f10e8c9bcb289e93874fce1a4b") else { return }
//        URLSession.shared.dataTask(with: url){ (data, _, _) in
//            print("hi")
//            guard let data = data else { return }
//            print("hello")
//            print(data)
//            let books = try! JSONDecoder().decode(MovieList.self, from: data)
//            DispatchQueue.main.async {
//                self.books = books
//                print(self.books)
//                print(self.books.results)
//            }
//        }.resume()
//    }
}
