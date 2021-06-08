//
//  SettingsView.swift
//  bookmark
//
//  Created by Megan on 5/25/21.
//

import SwiftUI

struct SettingsView: View {
    @State private var darkMode: Bool = false
    @Binding var username: String
    var savedBooks : FetchedResults<BookData>
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Profile Settings")
                    .font(Font.custom("Avenir", size: 20))
                    .fontWeight(.medium)
                    .padding(.bottom)
                TextField("Name", text: $username)
                    .padding(.horizontal)
                    .padding(.vertical, 5.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                    .font(Font.custom("Avenir", size: 20))
                
            }
            .padding([.leading, .bottom, .trailing])
            
            VStack(alignment: .leading) {
                Text("Account Settings")
                    .font(Font.custom("Avenir", size: 20))
                    .fontWeight(.medium)
                    .padding(.bottom)
                
                // clear reading list
                VStack(alignment: .leading) {
                    Text("Reading List")
                        .font(Font.custom("Avenir", size: 18))
                        .padding(.bottom)
                    
                    VStack {
                        Button(action:{
                            savedBooks.forEach(viewContext.delete)
                                do {
                                    try viewContext.save()
                                } catch {
                                    print("error clearing books")
                                }
                        } ) {
                            Text("CLEAR READING LIST")
                                .font(Font.custom("Avenir", size: 20))
                                .fontWeight(.bold)
                                .padding(.horizontal, 35.0)
                                .padding(.vertical, 12.0)
                                .foregroundColor(Color("MainColor"))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color("MainColor"), lineWidth: 2)
                                )
                        }
                        Text("careful, this action cannot be undone")
                            .font(Font.custom("Avenir", size: 15))
                            .fontWeight(.light)
                            .italic()
                    }
                }
                
                
            }
            .padding(.horizontal)
            
            
        }
        
    }
}

