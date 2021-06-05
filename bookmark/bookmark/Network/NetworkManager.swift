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
    @Published var books = BookList(results: [])
    @Published var loading = false
    private let api_key = "dbOUHC2GNZmbnGRzwbws2F3syLE7Wtge"
    private let api_url_base = "https://api.nytimes.com/svc/books/v3/lists/best-sellers/history.json?"
    private var offset = 0 // increments of 20; determines which 20 results of total to return
    private let numResults = 33672

    init() {
        loading = true
        next()
    }
    
    // Returns true if there are more books to fetch
    func hasNext() -> Bool {
        return offset < numResults
    }
    
    // Loads next set of books
    func next() {
        loading = true
        guard let url = URL(string: "\(api_url_base)offset=\(offset)&api-key=\(api_key)") else { return }
        URLSession.shared.dataTask(with: url){ (data, _, _) in

            guard let data = data else { return }
            print(data)
            let books = try! JSONDecoder().decode(BookList.self, from: data)
            DispatchQueue.main.async {
                self.books = books
                self.loading = false
                self.offset += 20
            }
        }.resume()
    }
}
