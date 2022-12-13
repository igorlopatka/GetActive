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
            let location = CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude)
            collectLocationData(location: location)
        }
    }
    
    func collectLocationData(location: CLLocationCoordinate2D) {
        if isActive {
            locationData.append(location)
            calculateDistance()
            print(totalDistance)
        }
    }
    
    func calculateDistance() {
        for location in 0..<locationData.count - 1 {
                    let start = locationData[location]
                    let end = locationData[location + 1]
                    let distance = getDistance(from: start, to: end)
                    totalDistance += distance
                }
    }
    
    func getDistance(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D) -> CLLocationDistance {
            // By Aviel Gross
            // https://stackoverflow.com/questions/11077425/finding-distance-between-cllocationcoordinate2d-points
            let from = CLLocation(latitude: from.latitude, longitude: from.longitude)
            let to = CLLocation(latitude: to.latitude, longitude: to.longitude)
            return from.distance(from: to)
        }
}
