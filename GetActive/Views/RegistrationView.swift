//
//  RegisterView.swift
//  GetActive
//
//  Created by Igor Łopatka on 09/11/2022.
//

import SwiftUI

struct RegistrationView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State private var email = ""
    @State private var password = ""
    @State private var passwordConfirmation = ""
    
    var body: some View {
        VStack(spacing: 15) {
            SignUpCredentialFields(email: $email,
                                   password: $password,
                                   passwordConfirmation: $passwordConfirmation)
            Button {
                // authenticate
            } label: {
                Text("Sign Up")
                    .bold()
                    .frame(width: 360, height: 50)
                    .background(.thinMaterial)
                    .cornerRadius(10)
            }
            Spacer()
            HStack {
                Text("Already have an account?")
                Button(action: {
                    viewRouter.currentPage = .signInPage
                }) {
                    Text("Log In")
                }
            }
            .opacity(0.9)
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

struct SignUpCredentialFields: View {
    
    @Binding var email: String
    @Binding var password: String
    @Binding var passwordConfirmation: String
    
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
            SecureField("Confirm Password", text: $passwordConfirmation)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
                .border(Color.red, width: passwordConfirmation != password ? 1 : 0)
                .padding(.bottom, 30)
        }
    }
}
