//
//  LoginView.swift
//  GetActive
//
//  Created by Igor Łopatka on 09/11/2022.
//

import Firebase
import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 15) {
            SignInCredentialFields(email: $email, password: $password)
            Button(action: {
                //Sign in user using Firebase
            }) {
                Text("Log In")
                    .bold()
                    .frame(width: 360, height: 50)
                    .background(.thinMaterial)
                    .cornerRadius(10)
            }
            Spacer()
            HStack {
                Text("Don't have an account?")
                Button(action: {
                    viewRouter.currentPage = .signUpPage
                }) {
                    Text("Sign Up")
                }
            }
            .opacity(0.9)
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct SignInCredentialFields: View {
    
    @Binding var email: String
    @Binding var password: String
    
    var body: some View {
        Group {
            TextField("Email", text: $email)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
                .textInputAutocapitalization(.never)
            SecureField("Password", text: $password)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
                .padding(.bottom, 30)
        }
    }
}
