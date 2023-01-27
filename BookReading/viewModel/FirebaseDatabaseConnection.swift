//
//  FirebaseDatabaseConnection.swift
//  BookReading
//
//  Created by a29asgha on 2023-01-26.
//

import FirebaseFirestore

class FirebaseDatabaseConnection: NSObject {
    let db = Firestore.firestore()
    
    func createDocument(collectionName: String, data: [String: Any], completion: @escaping (Error?) -> Void) {
        db.collection(collectionName).addDocument(data: data) { error in
            if error != nil {
                completion(error)
            } else {
                completion(nil)
            }
        }
    }
}
