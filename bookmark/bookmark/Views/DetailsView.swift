//
//  DetailsView.swift
//  bookmark
//
//  Created by Rawuda Jemal on 6/1/21.
//
import SwiftUI



struct DetailsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var id: Int
    var book: BookData
    var onDelete: (_ id: Int) -> Void
    var onRead: (_ id: Int) -> Void
    
    var body: some View {
        ScrollView {
            if (book.book != nil) {
            // Header
            HStack(alignment: .top) {
                Image("logo")
                VStack(alignment: .leading) {
                    Text(book.book!.title!)
                        .font(Font.custom("Avenir", size: 22))
                        .fontWeight(.bold)
                    Text(book.book!.author!)
                        .font(Font.custom("Avenir", size: 20))
                        .padding(.bottom, 2.0)
                    HStack {
                        if (self.book.book!.ranks_history!.list_name! != "") {
                        Text(self.book.book!.ranks_history!.list_name!.lowercased())
                                .font(Font.custom("Avenir", size: 15))
                                .padding(.vertical, 5.0)
                                .padding(/*@START_MENU_TOKEN@*/.horizontal, 10.0/*@END_MENU_TOKEN@*/)
                                .background(
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color("Color4"))
                                )
                        }
                        
                        if (book.read == 0) {
                            Text("TO READ")
                                .font(Font.custom("Avenir", size: 15))
                                .padding(.vertical, 5.0)
                                .padding(/*@START_MENU_TOKEN@*/.horizontal, 10.0/*@END_MENU_TOKEN@*/)
                                .background(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color("beige"), lineWidth: 1)
                                )
                                .onTapGesture {
                                    onRead(id)
                                }
                        } else {
                            Text("READ")
                                .font(Font.custom("Avenir", size: 15))
                                .padding(.vertical, 5.0)
                                .padding(/*@START_MENU_TOKEN@*/.horizontal, 10.0/*@END_MENU_TOKEN@*/)
                                .background(
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color("beige"))
                                )
                                .onTapGesture {
                                    onRead(id)
                                }
                        }
                    }
                }
                Spacer()
            }
            
            // Synopsis
            VStack(alignment: .leading) {
                Text("SYNOPSIS")
                    .font(Font.custom("Avenir", size: 15))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 5.0)
                Text(book.book!.desc == nil || book.book!.desc == "" ? "coming soon" : book.book!.desc!)
                    .font(Font.custom("Avenir", size: 14))
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            
            // Details
            VStack(alignment: .leading) {
                Text("DETAILS")
                    .font(Font.custom("Avenir", size: 15))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 5.0)
                if (self.book.book!.ranks_history != nil) {
                    Text("Published: \(self.book.book!.ranks_history!.published_date!)")
                        .font(Font.custom("Avenir", size: 14))
                }
                if (book.book!.publisher != nil) {
                    Text("Publisher: \(book.book!.publisher!)")
                        .font(Font.custom("Avenir", size: 14))
                }
                    Text("ISBN: \(book.book!.isbns!.isbn13!)")
                        .font(Font.custom("Avenir", size: 14))
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            
            // Delete button
            VStack {
                Button(action:{
                    self.presentationMode.wrappedValue.dismiss()
                    onDelete(id)
                } ) {
                    Text("REMOVE FROM LIST")
                        .padding(10)
                        .foregroundColor(Color("buttonRed"))
                        .font(Font.custom("Avenir", size: 20))
                        .background(
                            RoundedRectangle(cornerRadius: 7)
                                .stroke(Color("buttonRed"), lineWidth: 1)
                        )
                }
            }
            }
            
        }
        .padding(.horizontal)
    }
    
}

