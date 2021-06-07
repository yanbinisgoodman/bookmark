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
    @State private var cost = "Price: "
    
    var body: some View {
        ScrollView {
            HStack {
                VStack {
                    Image("bookCover")
                    .resizable()
                    .position( x: 143, y: 20)
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.top)
                        .frame(width: 145, height: 500)
                    Text(pub)
                        .offset(x: 40, y: -60)
                    Text(book.publisher ?? "n/a")
                        .offset(x: 120, y: -80)
                    Text(cost)
                        .offset(x: 25, y: -80)
                    Text(book.price)
                        .offset(x: 80, y: -100)
                }
                
                
                VStack{
                    Text(book.title)
                        .font(.system(size: 25))
                        .bold()
                        .position(x: 75, y: 70)
                    HStack {
                        VStack {
                            Text(book.author)
                                .position(x: 70, y: 10)
                            // todo: sub real values - rank is like not a thing? account for empty values
                            Text("Rank")
                                .offset(y:-40)
                                .font(.system(size: 15))
                                .background(RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.green)
                                            .frame(width: 140, height: 20)
                                            .offset(x:-5, y: -40))
                            
                            Text("List_name")
                                .offset(y:-30)
                                .font(.system(size: 15))
                                .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.orange)
                                .frame(width: 140, height: 20)
                                .offset(x:-5, y: -30)
                            )
                            Text("Age")
                                .offset(y:-20)
                                .font(.system(size: 15))
                                .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.yellow)
                                .frame(width: 140, height: 20)
                                .offset(x:-5, y: -20)
                            )
                                
                        }
                    }
                    //HStack{
                      //  Text(book.description ?? "coming soon")
                            //.position(x: 60, y: -20)
                   // }
                    Text("Synopsis")
                        .bold()
                        .position(x: -110, y: 20)
                    

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
                            .offset(x: -70, y: 75)
                            Text("Details")
                                .bold()
                                .offset(x: -205, y: -65)
                            Text(book.description ?? "coming soon")
                            .position(x: 70, y: -150)
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
