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
    @State var selectedTab = Tabs.Home
    
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
                SettingsView()
            } else if selectedTab == .Home {
                HomeView()
            } else {
                ReadingListView()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
