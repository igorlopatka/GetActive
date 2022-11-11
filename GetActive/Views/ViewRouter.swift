//
//  ViewRouter.swift
//  GetActive
//
//  Created by Igor Łopatka on 09/11/2022.
//

import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .signInPage
}

enum Page {
    case signUpPage
    case signInPage
    case homePage
}
