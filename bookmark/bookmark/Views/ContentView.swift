//
//  ContentView.swift
//  bookmark
//
//  Created by Megan on 5/22/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()

    var body: some View {
        NavigationView {
            if networkManager.loading {
                Text("Loading ...")
            } else {
                List(networkManager.books.results, id: \.title) { book in
                    Text(book.title)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
