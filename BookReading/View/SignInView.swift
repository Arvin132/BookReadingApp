//
//  SignInView.swift
//  BookReading
//
//  Created by a29asgha on 2023-01-26.
//

import SwiftUI

struct SignInView: View {
    @State var rememberMeVar = false
    @State private var username: String = ""
    @State private var password: String = ""
    
    
    
    var body: some View {
        VStack {
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
            HStack {
                Toggle("Remember me", isOn: $rememberMeVar)
                    .toggleStyle(.button)
                Spacer()
            }
            Spacer()
            Text("don't have an account?, sign up right here")
            Button {
                
            } label: {
                Text("Sign Up")
                    .padding()
                    .background(.gray)
                    .cornerRadius(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 2)
                    }
            }
        }
        .ignoresSafeArea()
        .background(.mint)
        
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
