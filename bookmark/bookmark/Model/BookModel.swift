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

struct Book: Decodable {
    let title: String
    let description: String?
    let author: String
    let price: String
    let age_group: String?
    let publisher: String?
    let isbns: [ISBN]
    let ranks_history: [RankHistory]
}

struct BookList: Decodable {
    var results: [Book]
}
