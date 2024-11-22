//
//  SignInView.swift
//  BookReading
//
//  Created by a29asgha on 2023-01-26.
//

import SwiftUI

struct SignInView: View {
    @State var wantsToSignUp: Bool = false
    
    var body: some View {
        
        if (!wantsToSignUp) {
            withAnimation(.easeInOut(duration: 0.35)) {
                SignInMainView(wantsToSignUp: $wantsToSignUp)
                    .frame(width: UIScreen.main.bounds.width,
                           height: UIScreen.main.bounds.height * 0.9)
                    .transition(.move(edge: .trailing))
            }
        } else {
            withAnimation(.easeInOut(duration: 0.35)) {
                SignUpView(wantsToSignUp: $wantsToSignUp)
                    .frame(width: UIScreen.main.bounds.width,
                           height: UIScreen.main.bounds.height * 0.9)
                    .transition(.move(edge: .trailing))
            }
        }
    }
}

struct SignInMainView: View {
    @Binding var wantsToSignUp: Bool
    @State var rememberMeVar = false
    @State var errorInLogin = false
    @State private var username: String = ""
    @State private var password: String = ""
    @EnvironmentObject var curUser: CurrentUser
    
    
    var body: some View {
        VStack {
            Spacer()
            TextField ("  Username (email address)", text: $username)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .padding()
                .border(.black, width: 2)
                .padding()
            SecureField(" Password ", text: $password)
                .padding()
                .border(.black, width: 2)
                .padding()
            if (errorInLogin) {
                HStack {
                    Text("* wrong Email or UserName")
                        .font(.caption)
                        .foregroundColor(.red)
                        .padding()
                    Spacer()
                }
            }
                
            Button {
                FireBaseAuthenticator.loginWithUser(email: username, password: password) { error, result in
                    if (error != nil || result == nil) {
                        password = ""
                        errorInLogin = true
                    } else {
                        curUser.uid = result?.user.uid
                        curUser.username = result?.user.email ?? " "
                        curUser.isLoggedIn = true
                    }
                }
            } label: {
                Text("Sign in")
                    .padding()
                    .background(.gray)
                    .cornerRadius(10)
                    
            }
            HStack {
                Toggle("Remember me", isOn: $rememberMeVar)
                    .toggleStyle(.button)
                    
                    .background(.white)
                    .cornerRadius(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 2)
                    }
                    .padding()
                Spacer()
            }
            Spacer()
            Text("don't have an account?, sign up right here")
            Button {
                withAnimation {
                    wantsToSignUp = true
                }
            } label: {
                Text("Sign Up")
                    .padding()
                    .background(.gray)
                    .cornerRadius(10)
                    .padding()
            }
        }
        .frame(width: UIScreen.main.bounds.width,
               height: UIScreen.main.bounds.height * 0.9)
        .frame(width: UIScreen.main.bounds.width,
               height: UIScreen.main.bounds.height)
        .background(.mint)
        
    }
}
