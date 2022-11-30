//
//  MapView.swift
//  GetActive
//
//  Created by Igor Łopatka on 26/11/2022.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    @ObservedObject var vm: ActivityViewModel
    
    func makeUIView(context: Context) -> MKMapView {
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
