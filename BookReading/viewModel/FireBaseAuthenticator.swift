//
//  FireBaseAuthenticator.swift
//  BookReading
//
//  Created by a29asgha on 2023-01-26.
//

import UIKit

import FirebaseAuth

class FireBaseAuthenticator: NSObject {
    func createUser(email: String, password: String) {
        
    }
    
    func signInWithUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            
        }
    }
    
    func loginWithUser(email: String, password: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                completion(error)
            } else {
                
            }
        }
    }
    
    
}
