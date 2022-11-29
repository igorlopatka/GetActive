//
//  ActivityDetailsViewModel.swift
//  GetActive
//
//  Created by Igor Łopatka on 28/11/2022.
//

import Foundation
import CoreLocation
import MapKit

class ActivityViewModel: ObservableObject {
    
    @Published var isActive = false
    @Published var timer = TimerManager()
    @Published var location = CLLocationManager()
    @Published var region = MKCoordinateRegion()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locations.last.map {
            region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
            )
        }
    }
}
