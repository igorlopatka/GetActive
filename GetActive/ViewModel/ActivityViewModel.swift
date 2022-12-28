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
    
    @Published var timer = TimerManager()
    
    @Published var isActive = false
    @Published var isPaused = false
    
    @Published var totalDistance = 0.0
    
    @Published var locationData = [CLLocationCoordinate2D]()
    @Published var region = MKCoordinateRegion()
    @Published var lastLocation: CLLocation?
    
    var locationManager: CLLocationManager
    
    override init() {
        locationManager = CLLocationManager()
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    var speed: Double {
        let speedMS = lastLocation?.speed ?? 0
        let speedDouble = Double(speedMS)
        return speedDouble
    }
    
    var speedKMH: String {
        // Speed in kilometers
        let kmh = speed * 3.6
        let formatted = String(format: "%.2f", kmh)
        return formatted
    }
    
    var distanceM: String {
        // Distance in meters
        let inMeters = totalDistance
        let formatted = String(format: "%.0f", inMeters)
        return formatted
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locations.last.map {
            let location = CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude)
            lastLocation = $0
            collectLocationData(location: location)
        }
    }
    
    func collectLocationData(location: CLLocationCoordinate2D) {
        if isActive {
            locationData.append(location)
            calculateDistance()
        }
    }
    
    func calculateDistance() {
        if locationData.count > 1 {
            let start = locationData[locationData.count - 2]
            let end = locationData[locationData.count - 1]
            let distance = getDistance(from: start, to: end)
            totalDistance += distance
        }
    }
    
    func getDistance(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D) -> CLLocationDistance {
        // https://stackoverflow.com/questions/11077425/finding-distance-between-cllocationcoordinate2d-points
        let from = CLLocation(latitude: from.latitude, longitude: from.longitude)
        let to = CLLocation(latitude: to.latitude, longitude: to.longitude)
        return from.distance(from: to)
    }
}
