//
//  BookView.swift
//  bookmark
//
//  Created by Liz on 6/4/21.
//

import SwiftUI

struct BookView: View {
    var book: (read: Int, book: Book)
    var id: Int
    var color: String
    
    
    init(id: Int, book: (read: Int, book: Book)) {
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
                    if (book.read == 1) {
                        Text("READ")
                            .font(Font.custom("Avenir", size: 15))
                            .foregroundColor(Color.black)
                            .padding(.vertical, 5.0)
                            .frame(maxWidth: .infinity)
                            .background(Color("beige"))
                    }
                    Spacer()
                    Text(book.book.title)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(5)
                        .font(Font.custom("Avenir", size: 20))
        
                    Text(book.book.author)
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

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView(id: 1, book: (read: 1, book: Book(title: "A GIRL'S GUIDE TO MOVING ON ", description: "A mother and her daughter-in-law both leave unhappy marriages and take up with new men.", author: "Debbie Macomber", price: "$27.99", age_group: "12", publisher: "NY Times", isbns: [ISBN(isbn10: "12345", isbn13: "123456789")], ranks_history: [RankHistory(primary_isbn10:"0761156860",primary_isbn13:"9780761156864",rank:10,list_name:"Travel",display_name:"Travel",published_date:"2015-04-12",bestsellers_date:"2015-03-28",weeks_on_list:0,rank_last_week:0,asterisk:0,dagger:0)])))
    }
}
