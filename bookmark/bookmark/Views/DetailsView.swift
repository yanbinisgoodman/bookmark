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
    var book: Book
    var onDelete: (_ id: Int) -> Void
    
    var body: some View {
        ScrollView {
            // Header
            HStack(alignment: .top) {
                Image("logo")
//                    .resizable()
//                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
//                    .scaledToFit()

                Spacer()
                VStack(alignment: .leading) {
                    Text(book.title)
                        .font(Font.custom("Avenir", size: 22))
                        .fontWeight(.bold)
                    Text(book.author)
                        .font(Font.custom("Avenir", size: 20))
                        .padding(.bottom, 2.0)
                    if (self.book.ranks_history.count > 0) {
                        Text(self.book.ranks_history[0].list_name.lowercased())
                            .font(Font.custom("Avenir", size: 15))
                            .padding(.vertical, 5.0)
                            .padding(/*@START_MENU_TOKEN@*/.horizontal, 10.0/*@END_MENU_TOKEN@*/)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color("Color4"))
                            )
                    }
                }
            }
            
            // Synopsis
            VStack(alignment: .leading) {
                Text("SYNOPSIS")
                    .font(Font.custom("Avenir", size: 15))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 5.0)
                Text(book.description ?? "coming soon")
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
                if (self.book.ranks_history.count > 0) {
                    Text("Published: \(self.book.ranks_history[0].published_date)")
                        .font(Font.custom("Avenir", size: 14))

                }
                if (book.publisher != nil) {
                    Text("Publisher: \(book.publisher!)")
                        .font(Font.custom("Avenir", size: 14))
                }
                Text("ISBN: \(book.isbns[0].isbn13)")
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
        .padding(.horizontal)
    }
    
}
       

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(id: 1, book: Book(title: "A GIRL'S GUIDE TO MOVING ON ", description: "A mother and her daughter-in-law both leave unhappy marriages and take up with new men.", author: "Debbie Macomber", price: "$27.99", age_group: "12", publisher: "NY Times", isbns: [ISBN(isbn10: "12345", isbn13: "123456789")], ranks_history: [RankHistory(primary_isbn10:"0761156860",primary_isbn13:"9780761156864",rank:10,list_name:"Travel",display_name:"Travel",published_date:"2015-04-12",bestsellers_date:"2015-03-28",weeks_on_list:0,rank_last_week:0,asterisk:0,dagger:0)]), onDelete: {id in print(id)})
    }
}
