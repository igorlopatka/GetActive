//
//  GetActiveApp.swift
//  GetActive
//
//  Created by Igor Łopatka on 02/11/2022.
//

import CoreLocation
import Firebase
import SwiftUI

@main
struct GetActiveApp: App {
    
    @StateObject var viewRouter = ViewRouter()
    
    init() {
            FirebaseApp.configure()
        }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewRouter)
        }
    }
}
