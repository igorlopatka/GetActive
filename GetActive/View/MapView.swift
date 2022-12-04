//
//  MapView.swift
//  GetActive
//
//  Created by Igor Łopatka on 26/11/2022.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    @Binding var locationData: [CLLocationCoordinate2D]
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: UIScreen.main.bounds)
        mapView.showsUserLocation = true
        mapView.isUserInteractionEnabled = false
        mapView.userTrackingMode = .follow
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        let polyline = MKPolyline(coordinates: locationData, count: locationData.count)
        view.addOverlay(polyline)
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
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let routePolyline = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: routePolyline)
            renderer.strokeColor = UIColor.red.withAlphaComponent(0.9)
            renderer.lineWidth = 7
            return renderer
        }
        return MKOverlayRenderer()
    }
}
