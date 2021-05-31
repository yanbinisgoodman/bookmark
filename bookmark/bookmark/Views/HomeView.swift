//
//  HomeView.swift
//  bookmark
//
//  Created by Megan on 5/22/21.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var networkManager = NetworkManager()

    var body: some View {
            if networkManager.loading {
                Text("Loading ...")
            } else {
                List(networkManager.books.results, id: \.title) { book in
                    Text(book.title)
                }
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
