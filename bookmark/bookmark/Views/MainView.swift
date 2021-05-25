//
//  MainView.swift
//  bookmark
//
//  Created by Megan on 5/25/21.
//

import SwiftUI

struct MainView: View {
    init() {
        // this doesn't show up in preview but works when run
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().layer.borderColor = UIColor.clear.cgColor
        // UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().clipsToBounds = true
    }
    
    var body: some View {
        // like i don't think tab views can go at the top so will
        // have to make our own custom one
        // https://stackoverflow.com/questions/62934308/how-can-i-create-tabview-with-headers-on-top-not-bottom-in-swiftui
        
        TabView {
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                }
            ContentView()
                .tabItem {
                    Image(systemName: "house")
                }
            ReadingListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                }
        }
        .accentColor(Color("MainColor"))
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
