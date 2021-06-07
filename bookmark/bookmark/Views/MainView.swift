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
    @ObservedObject var networkManager = NetworkManager()
    @State var selectedTab = Tabs.Home
    @State var readingList: [Book] = []
    @State var currentIndex: Int = 19   // current index in api results
    
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
                SettingsView(savedBooks: $readingList)
            } else if selectedTab == .Home {
                HomeView(networkManager: networkManager, savedBooks: $readingList, currentIndex: $currentIndex)
//                print(currentIndex)
            } else {
                ReadingListView(savedBooks: $readingList)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
