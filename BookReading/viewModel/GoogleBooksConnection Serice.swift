//
//  GoogleBooksConnection Serice.swift
//  BookReading
//
//  Created by Bahareh Ahmadi on 2023-01-21.
//


import SwiftyJSON
import SDWebImageSwiftUI

class BookDataGrabber: ObservableObject {
    @Published var data = [Book]()
    
    init() {}
    
    func searchForName(given: String) {
        let tokens = given.components(separatedBy: " ")
        var url = "https://www.googleapis.com/books/v1/volumes?q="
        tokens.forEach { token in
            url = url + token
        }
        url = url + "&maxResults=40"
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) {data,_,err in
            if err != nil {
                print("an ERROR was cuased fetching data")
                print((err?.localizedDescription)!)
                return
            }
            
            let json = try! JSON(data: data!)
            
            let items = json["items"].array!
            
            for i in items {
                let id = i["id"].stringValue
                let title = i["volumeInfo"]["title"].stringValue
                let authors = i["volumeInfo"]["authors"].stringValue
                let description = i["volumeInfo"]["description"].stringValue
                let imurl = i["volumeInfo"]["imageLinks"]["thumbnail"].stringValue
                let url = i["webReaderLink"].stringValue
                
                DispatchQueue.main.async {
                    self.data.append(Book(id: id, title: title, authors: authors, desc: description, imurl: imurl, url: url))
                }
            }
        }.resume()
    }
}
