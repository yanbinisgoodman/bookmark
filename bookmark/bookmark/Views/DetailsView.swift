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
//    var book: (read: Int, book: Book)
    var book: BookData
    var onDelete: (_ id: Int) -> Void
    var onRead: (_ id: Int) -> Void
    
    var body: some View {
        ScrollView {
            if (book.book != nil) {
            // Header
            HStack(alignment: .top) {
                Image("logo")
//                Spacer()
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
                // todo this validation
                if (self.book.book!.ranks_history != nil) {
                    Text("Published: \(self.book.book!.ranks_history!.published_date!)")
                        .font(Font.custom("Avenir", size: 14))
                }
                if (book.book!.publisher != nil) {
                    Text("Publisher: \(book.book!.publisher!)")
                        .font(Font.custom("Avenir", size: 14))
                }
//                if (book.book.isbns.count > 0) {
                    Text("ISBN: \(book.book!.isbns!.isbn13!)")
                        .font(Font.custom("Avenir", size: 14))
//                }
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
       

//struct DetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsView(id: 1, book: (read: 0, book: Book(title: "A GIRL'S GUIDE TO MOVING ON ", description: "A mother and her daughter-in-law both leave unhappy marriages and take up with new men.", author: "Debbie Macomber", price: "$27.99", age_group: "12", publisher: "NY Times", isbns: [ISBN(isbn10: "12345", isbn13: "123456789")], ranks_history: [RankHistory(primary_isbn10:"0761156860",primary_isbn13:"9780761156864",rank:10,list_name:"Travel",display_name:"Travel",published_date:"2015-04-12",bestsellers_date:"2015-03-28",weeks_on_list:0,rank_last_week:0,asterisk:0,dagger:0)])), onDelete: {id in print(id)}, onRead: {id in print(id)})
//    }
//}
