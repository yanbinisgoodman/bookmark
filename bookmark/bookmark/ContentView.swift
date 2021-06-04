//
//  ContentView.swift
//  bookmark
//
//  Created by Megan on 5/22/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
<<<<<<< HEAD:bookmark/bookmark/ContentView.swift
        Text("Hello, world!")
            .padding()
=======
        
            if networkManager.loading {
                Text("Loading ...")
            } else {
              
                List(networkManager.books.results, id: \.title) { book in
                    Text(book.title)
                }
                
            }
>>>>>>> elizabeth:bookmark/bookmark/Views/ContentView.swift
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
