//
//  ReadingListView.swift
//  bookmark
//
//  Created by Megan on 5/25/21.
//

import SwiftUI

struct ReadingListView: View {
    @ObservedObject var networkManager = NetworkManager()

    var body: some View {
        
//        let url = URL(string: "http://i.imgur.com/w5rkSIj.jpg")!
//        let data = try? Data(contentsOf: url)
//        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)

//        if let imageData = data {
//            imageView = UIImage(data: imageData)
//        }
        
//        var imageView : UIImageView
//        imageView  = UIImageView(frame:CGRect(x:10, y:50, width:100, height:300));
//        imageView.image = UIImage(named:"Test.jpeg")
//        self.view.addSubview(imageView)
//
        
    
 
        if networkManager.loading {
            Text("Loading ...")
        } else {

            List(networkManager.books.results, id: \.title) { book in
                VStack(alignment: .leading) {
                    Text(book.title)
                        .fontWeight(.semibold)
                    Text(book.author)
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                }
                //Text(book.title + "\n" + book.author).fontWeight(.semibold)
            }


        }
    }
}



struct ReadingListView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingListView()
    }
}
