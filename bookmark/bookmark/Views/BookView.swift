//
//  BookView.swift
//  bookmark
//
//  Created by Liz on 6/4/21.
//

import SwiftUI

struct BookView: View {
    var book: Book
    var id: Int
    var color: String
    
    
    init(id: Int, book: Book) {
        self.id = id
        self.book = book
        // TODO: fix these colors to use assets instead
        let colors: [String] = ["Red", "orange", "Yellow", "green", "blue", "navy"]
        if (id == -1) {
            self.color = "white"
        } else {
            self.color = colors[id % 6]
        }
    }
    
    var body: some View {
        if (id == -1) { // temp fake book to sub for inexistent odd number book pair
            Color(color)
            .overlay(
                VStack(spacing: 10) {
                    Text("")
                    Text("")
                }
            )
            .padding(20)
        } else {
            Color(color)
            .overlay(
                VStack(spacing: 10) {
                    Text(book.title)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(5)
                        .font(Font.custom("Avenir", size: 20))
        
                    Text(book.author)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(5)
                        .font(Font.custom("Avenir", size: 15))
                }
            )
            .padding(20)
        }
    }
}
