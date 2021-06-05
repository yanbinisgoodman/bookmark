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
    var color:Color
    
    init(id: Int, book: Book) {
        self.id = id
        self.book = book
        let colors: [Color] = [Color.blue, Color.yellow, Color.red, Color.orange]
        self.color = colors[id % 4]
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Color("Color4")
                HStack {
                    VStack(alignment: .leading, spacing: 20) {
                        Text(self.book.title)
                            .font(.system(size: 10))
                            .bold()
                            .multilineTextAlignment(.center)
                        Text(self.book.author)
                            .font(.system(size: 5))
                            .bold()
                            .multilineTextAlignment(.center)
                    }
                }
                .padding(.vertical)
            }
            .padding(.bottom)
            .background(self.color)
            .cornerRadius(10)
            .shadow(radius: 5)
        }
        .padding(.bottom, 100)
    }
}
