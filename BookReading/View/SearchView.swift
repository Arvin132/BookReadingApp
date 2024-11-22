//
//  SearchView.swift
//  BookReading
//
//  Created by Bahareh Ahmadi on 2023-01-15.
//

import SwiftUI
import SDWebImageSwiftUI

struct SearchView: View {
    @ObservedObject var viewModel = BookDataGrabber()
    @State var searchText = ""
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            List(viewModel.data) {book in
                Button {
                    
                } label: {
                    HStack {
                        WebImage(url: URL(string: book.imurl))
                            .resizable()
                            .frame(width:120, height: 170)
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text(book.title)
                                .fontWeight(.bold)
                            Text(book.authors)
                            Text(book.desc)
                                .font(.caption)
                                .lineLimit(4)
                                .multilineTextAlignment(.leading)
                        }
                    }
                }
            }
        }
        .overlay(alignment: .top) {
            SearchBarView(text: $searchText)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
