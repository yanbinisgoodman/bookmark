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
    
    @Published var currentIndex: Int {
        didSet {
            UserDefaults.standard.set(currentIndex, forKey: "currentIndex")
        }
    }
    
    init() {
        self.username = UserDefaults.standard.object(forKey: "username") as? String ?? ""
        self.currentIndex = UserDefaults.standard.object(forKey: "currentIndex") as? Int ?? 19
        self.networkManager = UserDefaults.standard.object(forKey: "networkManager") as? NetworkManager ?? NetworkManager()
    }
}
