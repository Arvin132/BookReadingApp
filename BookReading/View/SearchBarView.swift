//
//  SearchBarView.swift
//  BookReading
//
//  Created by Bahareh Ahmadi on 2023-01-22.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            
            TextField("Search...", text: $text) {
                print("commited")
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
                    withAnimation {
                        Button {
                            self.isEditing = false
                            self.text = ""
                        } label: {
                            Text("Cancel")
                        }
                        .padding(.trailing, 15)
                        .transition(.move(edge: .trailing))
                        
                    }
                }
            }
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(text: .constant(""))
    }
}
