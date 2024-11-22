//
//  User.swift
//  BookReading
//
//  Created by a29asgha on 2023-01-26.
//

import Foundation

class CurrentUser: ObservableObject {
    @Published var username: String
    @Published var isLoggedIn: Bool
    @Published var profileP : String = "dogImage"
    @Published var uid: String? = nil
    
    init(username: String = "", isLoggedIn: Bool = false) {
        self.username = username
        self.isLoggedIn = isLoggedIn
    }
    
    func clear() {
        self.username = ""
        self.isLoggedIn = false
        self.uid = nil
    }
}
