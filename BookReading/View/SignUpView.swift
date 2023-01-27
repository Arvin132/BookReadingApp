//
//  SignUpView.swift
//  BookReading
//
//  Created by a29asgha on 2023-01-26.
//

import SwiftUI

struct SignUpView: View {
    @Binding var wantsToSignUp: Bool
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var repeatPassword: String = ""
    @State private var showAlert: Bool = false
    
    var body: some View {
        VStack {
            TextField ("  Email address", text: $username)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .padding()
                .border(.black, width: 2)
                .padding()
            TextField ("  password", text: $password)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .padding()
                .border(.black, width: 2)
                .padding()
            TextField ("  repeat password", text: $repeatPassword)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .padding()
                .border(.black, width: 2)
                .padding()
            Button {
                FireBaseAuthenticator.createUser(email: username, password: password) {result, err in
                    if (err == nil) {
                        showAlert = true
                    } else {
                        wantsToSignUp = false
                    }
                }
            } label: {
                Text("Creat Account")
                    .padding()
                    .background(.gray)
                    .cornerRadius(10)
                    
            }
            .alert("Some Error Occured while trying to create your account, Please check your internet connection and try again later", isPresented: $showAlert) {
                Button("OK", role: .cancel) {}
            }
            Spacer()
            
        }
        .frame(width: UIScreen.main.bounds.width,
               height: UIScreen.main.bounds.height * 0.9)
        .frame(width: UIScreen.main.bounds.width,
               height: UIScreen.main.bounds.height)
        .background(.mint)
    }
}

