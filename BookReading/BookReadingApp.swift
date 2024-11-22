//
//  BookReadingApp.swift
//  BookReading
//
//  Created by Bahareh Ahmadi on 2023-01-15.
//

import SwiftUI

@main
struct BookReadingApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var curUser = CurrentUser()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(curUser)
        }
    }
}
