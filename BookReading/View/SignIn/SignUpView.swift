//
//  SignUpView.swift
//  BookReading
//
//  Created by a29asgha on 2023-01-26.
//

import SwiftUI

func correctPassword(given: String, givenRepeat: String) -> Int {
    if (given != givenRepeat) { return -1 }
    if (given.count < 7) { return -1 }
    let decimalCharacters = CharacterSet.decimalDigits
    let decimalRange = given.rangeOfCharacter(from: decimalCharacters)
    if decimalRange == nil { return 1 }
    return 0
}


struct SignUpView: View {
    @Binding var wantsToSignUp: Bool
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var repeatPassword: String = ""
    @State private var showAlert: Bool = false
    @State private var badString: Bool = false
    
    
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    withAnimation {
                        wantsToSignUp = false
                    }
                } label: {
                    Text("< Go Back")
                        .padding(5)
                        .background(.gray)
                        .cornerRadius(10)
                        .padding(.leading)
                }
                Spacer()
            }
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
                if (correctPassword(given: password, givenRepeat: repeatPassword) == 0) {
                    FireBaseAuthenticator.createUser(email: username, password: password) {result, err in
                        if (err == nil) {
                            showAlert = true
                        } else {
                            withAnimation {
                                wantsToSignUp = false
                            }
                        }
                    }
                } else {
                    badString = true
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
            if (badString) {
                    Text("Password does not hold conditions or the two passwords you have entered are not the same")
                        .font(.caption)
                        .foregroundColor(.red)
            }
            Text("your password should have following conditions:")
                .font(.caption)
            Text("at Least 8 characters in size")
                .font(.caption)
            Text("At least one number")
                .font(.caption)
            Spacer()
            
        }
        .frame(width: UIScreen.main.bounds.width,
               height: UIScreen.main.bounds.height * 0.9)
        .frame(width: UIScreen.main.bounds.width,
               height: UIScreen.main.bounds.height)
        .background(.mint)
    }
}

