//
//  LibraryView.swift
//  BookReading
//
//  Created by Bahareh Ahmadi on 2023-01-15.
//

import SwiftUI

struct LibraryView: View {
    @EnvironmentObject var curUser: CurrentUser
    var body: some View {
        withAnimation(.easeInOut(duration: 0.35)) {
            Text("This is Library of User with uid: \(String(describing: curUser.uid)) and username(email) of \(String(describing: curUser.username))")
                .transition(.move(edge: .leading))
                
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
