//
//  BookView.swift
//  bookmark
//
//  Created by Liz on 6/4/21.
//

import SwiftUI

struct BookView: View {
    var book: BookData
    var id: Int
    var color: String
    
    
    init(id: Int, book: BookData) {
        self.id = id
        self.book = book
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
                    if (book.read == 1) {
                        Text("READ")
                            .font(Font.custom("Avenir", size: 15))
                            .foregroundColor(Color.black)
                            .padding(.vertical, 5.0)
                            .frame(maxWidth: .infinity)
                            .background(Color("beige"))
                    }
                    Spacer()
                    Text(book.book!.title!)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(5)
                        .font(Font.custom("Avenir", size: 20))
        
                    Text(book.book!.author!)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(5)
                        .font(Font.custom("Avenir", size: 15))
                    Spacer()
                }
            )
            .padding(20)
        }
    }
}

