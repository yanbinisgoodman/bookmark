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
        let colors: [String] = ["Color1", "Color2", "Color3", "Color4"]
        self.color = colors[id % 4]
    }
    
    var body: some View {
        Color(color)
            .overlay(
                VStack {
                    Text(book.title)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        
                    Text(book.author)
                        .foregroundColor(Color.white)
                }
            )
    }
}
