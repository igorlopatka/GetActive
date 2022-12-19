//
//  ActivityView.swift
//  GetActive
//
//  Created by Igor Łopatka on 07/11/2022.
//

import Firebase
import MapKit
import SwiftUI

struct ActivityView: View {
        
    @StateObject var vm = ActivityViewModel()
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State private var signOutProcessing = false
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                VStack {
                    MapView(locationData: $vm.locationData)
                    .ignoresSafeArea()
                    .navigationTitle("Get Active")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            if signOutProcessing {
                                ProgressView()
                            } else {
                                Button("Sign Out") {
                                    signOutUser()
                                }
                            }
                        }
                    }
                    ActivityDetailsView(vm: vm)
                        .frame(height: geo.size.height / 2.4)
                }
            }
        }
    }
    
    func signOutUser() {
        signOutProcessing = true
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
            signOutProcessing = false
        }
        withAnimation {
            viewRouter.currentPage = .signInPage
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
