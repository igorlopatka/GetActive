//
//  ContentView.swift
//  GetActive
//
//  Created by Igor Łopatka on 02/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        switch viewRouter.currentPage {
        case .signUpPage:
            SignUpView()
        case .signInPage:
            SignInView()
        case .homePage:
            ActivityView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
