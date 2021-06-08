//
//  UserSettings.swift
//  bookmark
//
//  Created by Megan on 6/7/21.
//

import Foundation
import Combine

class UserSettings: ObservableObject {
    @Published var networkManager: NetworkManager {
        didSet {
            UserDefaults.standard.set(networkManager, forKey: "networkManager")
        }
    }
    
    @Published var username: String {
        didSet {
            UserDefaults.standard.set(username, forKey: "username")
        }
    }
    
    @Published var readingList: [(read: Int, book: Book)] {
        didSet {
            UserDefaults.standard.set(readingList, forKey: "readingList")
        }
    }
    
    @Published var currentIndex: Int {
        didSet {
            UserDefaults.standard.set(currentIndex, forKey: "currentIndex")
        }
    }
    
    init() {
        self.username = UserDefaults.standard.object(forKey: "username") as? String ?? ""
        self.readingList = UserDefaults.standard.object(forKey: "readingList") as? [(read: Int, book: Book)] ?? []
        self.currentIndex = UserDefaults.standard.object(forKey: "currentIndex") as? Int ?? 19
        self.networkManager = UserDefaults.standard.object(forKey: "networkManager") as? NetworkManager ?? NetworkManager()
    }
}
