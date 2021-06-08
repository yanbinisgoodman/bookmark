//
//  MainView.swift
//  bookmark
//
//  Created by Megan on 5/25/21.
//

import SwiftUI

enum Tabs {
    case Settings
    case Home
    case ReadingList
}

struct MainView: View {
//    @ObservedObject var networkManager = NetworkManager()
    @ObservedObject var userSettings = UserSettings()
    @AppStorage("readingList") private var testReadingList: Data = Data()
    @State var selectedTab = Tabs.Home
    @State var readingList: [(read: Int, book: Book)] = []
//    @State var currentIndex: Int = 19   // current index in api results
//    @State var username: String = ""
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \BookData.book?.title, ascending: true)],
            animation: .default)
        private var savedBooks: FetchedResults<BookData>
    init() {
        let books = userSettings.networkManager.books.results
        for book in books {
            let bookDataItem = BookData(context: viewContext)
            let bookItem = BookItem(context: viewContext)
            let ISBN = ISBNItem(context: viewContext)
            let rankHistory = RankHistoryItem(context: viewContext)
            
            rankHistory.published_date = book.ranks_history.count > 0 ? book.ranks_history[0].published_date : nil
            rankHistory.list_name = book.ranks_history.count > 0 ? book.ranks_history[0].list_name : nil
            ISBN.isbn10 = book.isbns.count > 0 ? book.isbns[0].isbn10 : ""
            ISBN.isbn13 = book.isbns.count > 0 ? book.isbns[0].isbn13 : ""
            
            bookItem.title = book.title
            bookItem.desc = book.description
            bookItem.author = book.author
            bookItem.publisher = book.publisher
            bookItem.isbns = ISBN
            bookItem.ranks_history = rankHistory
            
            bookDataItem.read = 0
            bookDataItem.book = bookItem
            do {
                try viewContext.save()
            } catch {
                print("error saving book")
            }
        }
    }

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: "gear")
                .foregroundColor(selectedTab == .Settings ? Color("MainColor") : Color.black)
                .onTapGesture {
                    self.selectedTab = .Settings
                }
                
                Spacer()
                Spacer()
                
                Image(systemName: "house")
                .foregroundColor(selectedTab == .Home ? Color("MainColor") : Color.black)
                .onTapGesture {
                    self.selectedTab = .Home
                }
                
                Spacer()
                Spacer()
                
                Image(systemName: "list.bullet")
                .foregroundColor(selectedTab == .ReadingList ? Color("MainColor") : Color.black)
                .onTapGesture {
                    self.selectedTab = .ReadingList
                }
                Spacer()
            }
            .padding(.bottom)
            .background(Color.white.edgesIgnoringSafeArea(.all))
            
            Spacer()
            
            if selectedTab == .Settings {
                // todo: settings view?
                SettingsView(username: $userSettings.username, savedBooks: savedBooks)
//                SettingsView(username: $userSettings.username)

            } else if selectedTab == .Home {
                HomeView(networkManager: userSettings.networkManager, savedBooks: savedBooks, currentIndex: $userSettings.currentIndex)
//                print(currentIndex)
            } else {
                ReadingListView(savedBooks: savedBooks, username: userSettings.username)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
