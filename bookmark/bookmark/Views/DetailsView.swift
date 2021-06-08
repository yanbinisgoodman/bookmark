//
//  DetailsView.swift
//  bookmark
//
//  Created by Rawuda Jemal on 6/1/21.
//
import SwiftUI



struct DetailsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var textButton = "Remove from list"
    
    var id: Int
    var book: Book
    var onDelete: (_ id: Int) -> Void
    
    
    
    @State private var pub = "Publisher: "
    @State private var isbn = "ISBN: "
    
    var body: some View {
        ScrollView {
            HStack {
                VStack {
                    Image("Color1")
                    .resizable()
                    .position( x: 143, y: -20)
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.top)
                        .frame(width: 145, height: 500)
                    Text(pub)
                        .offset(x: 40, y: -158)
                    Text(book.publisher ?? "n/a")
                        .offset(x: 120, y: -179)
                    Text(isbn)
                        .offset(x: 25, y: -170)
                    Text(book.ranks_history.count > 0 ? book.ranks_history[0].primary_isbn13 : "n/a")
                        .offset(x: 130, y: -190)
                }
                
                
                VStack{
                    Text(book.title)
                        .font(.system(size: 25))
                        .bold()
                        .position(x: 75, y: -20)
                    HStack {
                        VStack {
                            Text(book.author)
                                .position(x: 70, y: -100)
                            // todo: sub real values - rank is like not a thing? account for empty values
                            Text(book.ranks_history.count > 0 ? "\(book.ranks_history[0].rank)": "n/a")
                                .offset(y:-150)
                                .font(.system(size: 15))
                                .background(RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.green)
                                            .frame(width: 140, height: 20)
                                            .offset(x:-5, y: -150))
                            
                            Text(book.ranks_history.count > 0 ? book.ranks_history[0].list_name : "n/a")
                                .offset(y:-130)
                                .font(.system(size: 15))
                                .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.orange)
                                .frame(width: 140, height: 20)
                                .offset(x:-5, y: -130)
                            )
                            /*Text(book.age_group ?? "n/a")
                                .offset(y:-20)
                                .font(.system(size: 10))
                                .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.yellow)
                                .frame(width: 140, height: 20)
                                .offset(x:-5, y: -20)

                            )
                             */
                                
                        }
                    }
                    //HStack{
                      //  Text(book.description ?? "coming soon")
                            //.position(x: 60, y: -20)
                   // }
                    Text("Synopsis")
                        .bold()
                        .position(x: -47, y: -70)
                    

                    HStack{
                        
                        VStack {
                            Button(action:{
                                self.presentationMode.wrappedValue.dismiss()
                                onDelete(id)
                                self.textButton = "Removed"
                            } ) {
                                Text(textButton)
                                    .padding(10)
                                    .border(Color.red)
                                    .foregroundColor(.red)
                                    
                                
                            }
                            .offset(x: -70, y: -5)
                            Text("Details")
                                .bold()
                                .offset(x: -205, y: -170)
                            
                            Text(book.description ?? "coming soon")
                            .position(x: 70, y: -250)
                                .frame(width: 300)

                        }
     
                    }

                }
                            
            }
        }
    }
    
    
}
       

//struct DetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsView(book: Book(title: "A GIRL'S GUIDE TO MOVING ON ", description: "A mother and her daughter-in-law both leave unhappy marriages and take up with new men.", author: "Debbie Macomber", price: "$27.99", age_group: "12", publisher: "NY Times", ranks_history: []), id: 1)
//    }
//}
