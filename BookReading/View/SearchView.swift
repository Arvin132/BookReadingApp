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
        .overlay(alignment: .top) {
            HStack {
                
                TextField("Search...", text: $searchText) {
                    viewModel.data = []
                    viewModel.searchForName(given: searchText)
                }
                .keyboardType(.webSearch)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray4))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
                .overlay(alignment: .trailing) {
                    if isEditing {
                        Button {
                            self.isEditing = false
                            self.searchText = ""
                        } label: {
                            Text("Cancel")
                        }
                        .padding(.trailing, 15)
                        .transition(.move(edge: .trailing))
                        .animation(.default)
                    }
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
