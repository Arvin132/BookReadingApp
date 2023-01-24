//
//  BookDetailedView.swift
//  BookReading
//
//  Created by Bahareh Ahmadi on 2023-01-23.
//

import SwiftUI

struct BookDetailedView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Image("dogImage")
                Text("some Text")
            }
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height * 0.9)
        }
    }
}

struct BookDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailedView()
    }
}
