//
//  CardView.swift
//  bookmark
//
//  Created by Megan on 5/31/21.
//

import SwiftUI

struct CardView: View {
    @State private var translation: CGSize = .zero
    private var thresholdPercentage: CGFloat = 0.5
    
    var book: Book
    var id: Int
    private var onRemove: (_ id: Int, _ book: Book, _ swipedRight: Bool) -> Void
    
    
    init(id: Int, book: Book, onRemove: @escaping (_ id: Int, _ book: Book, _ swipedRight: Bool) -> Void) {
//        self.id = id
//        self.book = book
        self.id = id
        self.book = book
        self.onRemove = onRemove
    }
    
    // percentage of our own width have we swipped
    // - Parameters:
    //   - geometry: The geometry
    //   - gesture: The current gesture translation value
    private func getGesturePercentage(_ geometry: GeometryProxy, from gesture: DragGesture.Value) -> CGFloat {
        gesture.translation.width / geometry.size.width
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Color("Color4")
                    .overlay(
                        VStack {
                            Text(self.book.title)
                                .foregroundColor(Color.white)
                                .font(.title).bold()
                                .multilineTextAlignment(.center)
                                
                            Text("By " + self.book.author)
                                .foregroundColor(Color.white)
                                .font(.title3)
                            
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.75)
                            .clipped()
                    )
                
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(self.book.title)
                            .font(.headline)
                            .bold()
                        Text(self.book.author)
                            .font(.subheadline)
                            .bold()
                        Text(self.book.ranks_history.count > 0 ? self.book.ranks_history[0].list_name : "")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }.padding(.horizontal)
            }
            .padding(.bottom)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            // swipe behavior
            .animation(.interactiveSpring())
            .offset(x: self.translation.width, y: 0)
            .rotationEffect(.degrees(Double(self.translation.width / geometry.size.width) * 25), anchor: .bottom)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.translation = value.translation
                    }.onEnded { value in
                        // determine snap distance > half the width of the screen
                        if abs(self.getGesturePercentage(geometry, from: value)) > self.thresholdPercentage {
                            self.onRemove(self.id, self.book, self.getGesturePercentage(geometry, from: value) > 0)
                        } else {
                            self.translation = .zero
                        }
                    }
            )
        }
    }
}

// 4
//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView(book: Book(title: "Mark", description: "Bennett", author: "Ash", price: "27", age_group: <#T##String?#>: "12", publisher: "person_1", ranks_history: <#T##[RankHistory]#>: "Insurance Agent"),
//                 onRemove: { _ in
//                    // do nothing
//            })
//            .frame(height: 400)
//            .padding()
//    }
//    }
//}
