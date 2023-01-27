//
//  FireBaseAuthenticator.swift
//  BookReading
//
//  Created by a29asgha on 2023-01-26.
//

import UIKit

import FirebaseAuth

class FireBaseAuthenticator {
    
    static func createUser(email: String, password: String, completion: @escaping (Error?, AuthDataResult?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, err in
            if (err != nil || result == nil) {
                completion(err, result)
            } else {
                let user = result?.user
                let connection = FirebaseDatabaseConnection()
                connection.createDocument(collectionName: user!.uid, data: [:]) {_ in
                    
                }
                completion(nil, result)
            }
        }
    }
    
    
    
    static func loginWithUser(email: String, password: String, completion: @escaping (Error?, AuthDataResult?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                completion(error, nil)
            } else {
                completion(nil, result)
            }
        }
    }
    
    
}
