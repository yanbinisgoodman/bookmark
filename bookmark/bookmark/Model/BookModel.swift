//
//  Books.swift
//  bookmark
//
//  Created by Megan on 5/22/21.
//

import Foundation
import SwiftUI

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
//
//struct Review: Decodable {
//    let book_review_link: String
//    let first_chapter_link: String
//    let sunday_review_link: String
//    let article_chapter_link: String
//}

struct Book: Decodable {
    let title: String
    let description: String?
//    let contributor: String?
    let author: String
//    let contributor_note: String
    let price: String
    let age_group: String?
    let publisher: String?
    let isbns: [ISBN]
    let ranks_history: [RankHistory]
//    let reviews: [Review]
}

struct BookList: Decodable {
    var results: [Book]
}
