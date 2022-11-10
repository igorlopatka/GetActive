//
//  RegisterView.swift
//  GetActive
//
//  Created by Igor Łopatka on 09/11/2022.
//

import Firebase
import SwiftUI

struct SignUpView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State private var email = ""
    @State private var password = ""
    @State private var passwordConfirmation = ""
    
    @State private var signUpProcessing = false
    
    var body: some View {
        VStack(spacing: 15) {
            SignUpCredentialFields(email: $email,
                                   password: $password,
                                   passwordConfirmation: $passwordConfirmation)
            Button {
                signUpUser(userEmail: email, userPassword: password)
            } label: {
                Text("Sign Up")
                    .bold()
                    .frame(width: 360, height: 50)
                    .background(.thinMaterial)
                    .cornerRadius(10)
            }
            .disabled(!signUpProcessing && !email.isEmpty && !password.isEmpty && !passwordConfirmation.isEmpty && password == passwordConfirmation ? false : true)
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
        .padding()
    }
    
    func signUpUser(userEmail: String, userPassword: String) {
        
        signUpProcessing = true
        Auth.auth().createUser(withEmail: userEmail, password: userPassword) { authResult, error in
            guard error == nil else {
                signUpProcessing = false
                return
            }
            
            switch authResult {
            case .none:
                print("Could not create account.")
                signUpProcessing = false
            case .some(_):
                print("User created")
                signUpProcessing = false
                viewRouter.currentPage = .homePage
            }
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
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
