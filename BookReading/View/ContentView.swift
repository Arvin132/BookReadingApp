//
//  ContentView.swift
//  BookReading
//
//  Created by Bahareh Ahmadi on 2023-01-15.
//

import SwiftUI



struct ContentView: View {
    @StateObject var sheetManager = SheetManager()
    @State var selected = 0
    @State var haveLogined = false
    let tabBarItems =
    [
    TabItemData(image: "book.closed", selectedImage: "book", title: "My Books"),
    TabItemData(image: "magnifyingglass.circle", selectedImage: "magnifyingglass.circle.fill", title: "Search"),
    TabItemData(image: "message", selectedImage: "message.fill", title: "Disscuss")
    ]
    
    var body: some View {
        VStack {
            if (haveLogined) {
                if(selected == 0) {
                    LibraryView()
                } else if (selected == 1) {
                    SearchView()
                } else if (selected == 2){
                    DisscussView()
                }
            } else {
                SignInView()
            }
        }
        .frame(width: UIScreen.main.bounds.width,
               height: UIScreen.main.bounds.height * 0.9)
        .overlay(alignment: .bottom, content: {
            if (haveLogined) {
                TabBottomView(tabbarItems: tabBarItems, selectedIndex: $selected)
            }
        })
        .overlay(alignment: .topLeading, content: {
            if (selected == 0 && haveLogined) {
                Button {
                    
                } label: {
                    Image(sheetManager.profileP)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                }
                .padding()
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
