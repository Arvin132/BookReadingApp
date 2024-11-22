//
//  ContentView.swift
//  BookReading
//
//  Created by Bahareh Ahmadi on 2023-01-15.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var curUser: CurrentUser
    @State var selected = 0
    let tabBarItems =
    [
        TabItemData(image: "book.closed", selectedImage: "book", title: "My Books"),
        TabItemData(image: "magnifyingglass.circle", selectedImage: "magnifyingglass.circle.fill", title: "Search"),
        TabItemData(image: "message", selectedImage: "message.fill", title: "Disscuss")
    ]
    
    let ContentViewPages: [Int: AnyView] =
    [
        0: AnyView(LibraryView()),
        1: AnyView(SearchView()),
        2: AnyView(DisscussView())
    ]
    
    var body: some View {
        NavigationView{
            VStack {
                if (curUser.isLoggedIn) {
                    ContentViewPages[selected]
                        .frame(width: UIScreen.main.bounds.width,
                               height: UIScreen.main.bounds.height * 0.9)
                        .overlay(alignment: .bottom, content: {
                            TabBottomView(tabbarItems: tabBarItems, selectedIndex: $selected)
                        })
                        .overlay(alignment: .topLeading, content: {
                            if (selected == 0) {
                                ProfileIcon()
                            }
                        })
                } else {
                    SignInView()
                }
            }
            .onAppear {
                curUser.isLoggedIn = FireBaseAuthenticator.checkIfCurrentUserIsSignedIn()
                if (curUser.isLoggedIn) {
                    let (uid, email) = FireBaseAuthenticator.getCurrentUser()
                    curUser.uid = uid
                    curUser.username = email
                }
            }
        }
    }
}

struct ProfileIcon: View {
    @EnvironmentObject var curUser: CurrentUser
    var body: some View {
        NavigationLink(destination: ProfileDetailedView()) {
            Image(curUser.profileP)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
        }
        .padding()
    }
}
