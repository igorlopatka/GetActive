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
    @State private var region = MKCoordinateRegion(
        center:  CLLocationCoordinate2D(
          latitude: 37.789467,
          longitude:-122.416772
        ),
        span: MKCoordinateSpan(
          latitudeDelta: 0.5,
          longitudeDelta: 0.5
       )
    )
    
    var body: some View {
        NavigationView {
            Map(coordinateRegion: $region)
                .ignoresSafeArea()
                .navigationTitle("Get Active")
        }
        .sheet(isPresented: $showingDetails) {
                    ActivityDetailsView()
                .presentationDetents([.height(200), .medium, .large])
                }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
