//
//  ActivityView.swift
//  GetActive
//
//  Created by Igor Łopatka on 07/11/2022.
//

import MapKit
import SwiftUI


struct ActivityView: View {
    
    @State private var showingDetails = true
    @State private var trackingMode = MapUserTrackingMode.follow
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        NavigationStack {
            Map(coordinateRegion: $locationManager.region,
                interactionModes: .pan,
                showsUserLocation: true,
                userTrackingMode: $trackingMode)
            .ignoresSafeArea()
            .navigationTitle("Get Active")
//            .toolbarBackground(.visible, for: .navigationBar)
        }
        .sheet(isPresented: $showingDetails) {
            ActivityDetailsView()
                .presentationDetents([
                    .height(200),
                    .medium])
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
