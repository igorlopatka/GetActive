//
//  ActivityDetailsViewModel.swift
//  GetActive
//
//  Created by Igor Łopatka on 28/11/2022.
//

import Foundation
import CoreLocation
import MapKit

class ActivityViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var isActive = false
    @Published var timer = TimerManager()
    @Published var locationData = [CLLocation]()
    @Published var region = MKCoordinateRegion()
    
    
    var locationManager: CLLocationManager
    
    override init() {
        locationManager = CLLocationManager()
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locations.last.map {
            region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
            )
            print(locations)
        }
    }
}
