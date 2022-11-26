//
//  MapView.swift
//  GetActive
//
//  Created by Igor Łopatka on 26/11/2022.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    let region: MKCoordinateRegion
    //  let lineCoordinates: [CLLocation]
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.region = region
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {}
    
    // Link it to the coordinator which is defined below.
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
