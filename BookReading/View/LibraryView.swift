//
//  LibraryView.swift
//  BookReading
//
//  Created by Bahareh Ahmadi on 2023-01-15.
//

import SwiftUI

struct LibraryView: View {
    var body: some View {
        Text("This is Library")
            .transition(.move(edge: .leading))
            .animation(.default)
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
