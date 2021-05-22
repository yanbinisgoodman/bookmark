//
//  Books.swift
//  bookmark
//
//  Created by Megan on 5/22/21.
//

import Foundation
import SwiftUI

//struct Results: Codable, Identifiable {
//    var id = UUID()
//    let status: String
//    let copyright: String
//    let num_results: Int
//    let books: [Book]
//}
//struct Movie: Decodable {
//  var vote_count: Int
//  var id: Int
//  var vote_average: Float
//  var title: String
//  var poster_path: String
//  var original_language: String
//  var original_title: String
//  var adult: Bool
//  var overview: String
//  var release_date: String
//}
//
//struct MovieList: Decodable {
//  var results: [Movie]
//}

struct ISBN: Decodable {
    let isbn10: String
    let isbn13: String
}

struct RankHistory: Decodable {
    let primary_isbn10: String
    let primary_isbn13: String
    let rank: Int
    let list_name: String
    let display_name: String
    let published_date: String
    let bestsellers_date: String
    let weeks_on_list: Int
    let rank_last_week: Int
    let asterisk: Int
    let dagger: Int
}

struct Review: Decodable {
    let book_review_link: String
    let first_chapter_link: String
    let sunday_review_link: String
    let article_chapter_link: String
}

struct Book: Decodable {
    let title: String
    let description: String?
//    let contributor: String?
    let author: String
//    let contributor_note: String
    let price: String
    let age_group: String?
    let publisher: String?
//    let isbns: [ISBN]
//    let ranks_history: [RankHistory]
//    let reviews: [Review]
}

struct BookList: Decodable {
    var results: [Book]
}



//struct Comments: Codable, Identifiable {
//    var id = UUID()
//    let name: String
//    let email: String
//    let body: String
//    
//}


//class apiCall {
//    func getUserComments(completion:@escaping ([Book]) -> ()) {
//        guard let url = URL(string: "https://api.nytimes.com/svc/books/v3/lists/best-sellers/history.json?offset=20&api-key=dbOUHC2GNZmbnGRzwbws2F3syLE7Wtge") else { return }
//        
//        URLSession.shared.dataTask(with: url) { (data, _, _) in
//            let comments = try! JSONDecoder().decode([Book].self, from: data!)
//            print(comments)
////            print(data)
//            
//            DispatchQueue.main.async {
//                completion(comments)
//            }
//        }
//        .resume()
//    }
//}
