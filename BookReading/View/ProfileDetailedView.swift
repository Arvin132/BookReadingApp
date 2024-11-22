//
//  ProfileDetailedView.swift
//  BookReading
//
//  Created by Guest-Arvin on 2024-11-21.
//

import SwiftUI

struct ProfileDetailedView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var curUser: CurrentUser
    var body: some View {
        VStack {
            Button {
                presentationMode.wrappedValue.dismiss()
                let _ = FireBaseAuthenticator.logoutUser()
                curUser.clear()
            } label: {
                Text("Logout")
                    .padding()
                    .background(Color.gray)
                    .border(Color.black)
                    .cornerRadius(10)
            }
        }
        .navigationBarBackButtonHidden(false)
    }
}
