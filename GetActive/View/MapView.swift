//
//  MapView.swift
//  GetActive
//
//  Created by Igor Łopatka on 26/11/2022.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    var region = MKCoordinateRegion()
//    var locationManager = CLLocationManager()
    @ObservedObject var vm = ActivityViewModel()
    
    func setupManager() {
        vm.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        vm.locationManager.requestWhenInUseAuthorization()
        vm.locationManager.startUpdatingLocation()
    }
    
    mutating func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locations.last.map {
            region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
            )
        }
    }

    func makeUIView(context: Context) -> MKMapView {
        setupManager()
        let mapView = MKMapView(frame: UIScreen.main.bounds)
        mapView.showsUserLocation = true
        mapView.isUserInteractionEnabled = false
        mapView.userTrackingMode = .follow
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
    }
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

class Coordinator: NSObject, MKMapViewDelegate {
    var parent: MapView
    
    init(_ parent: MapView) {
        self.parent = parent
    }
}
