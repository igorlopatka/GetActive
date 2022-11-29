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
    
    @State private var showingDetails = true
    @State private var signOutProcessing = false
    
    var body: some View {
        NavigationStack {
            MapView(vm: vm)
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
        }
        .sheet(isPresented: $showingDetails) {
            ActivityDetailsView()
                .presentationDetents([
                    .height(200),
                    .medium])
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
