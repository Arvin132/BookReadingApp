//
//  AppDelegate.swift
//  BookReading
//
//  Created by Bahareh Ahmadi on 2023-01-23.
//

import UIKit
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
