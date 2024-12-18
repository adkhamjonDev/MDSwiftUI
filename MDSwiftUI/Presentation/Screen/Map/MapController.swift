//
//  MapController.swift
//  MDSwiftUI
//
//  Created by Adkhamjon Rakhimov on 10/12/24.
//
import Foundation
import MapKit
import SwiftUI

class MapController: ObservableObject {
    var mapView: MKMapView?
    private let zoomStep: CLLocationDistance = 10000 // Change altitude by 2000 meters
    
    func setMapView(_ mapView: MKMapView) {
        self.mapView = mapView
    }
    
    func zoomIn() {
        guard let mapView = mapView else { return }
        let newAltitude = max(mapView.camera.centerCoordinateDistance - zoomStep, 10000) // Min altitude
        mapView.camera.centerCoordinateDistance = newAltitude
    }
    
    func zoomOut() {
        guard let mapView = mapView else { return }
        let newAltitude = min(mapView.camera.centerCoordinateDistance + zoomStep, 1500000) // Max altitude
        mapView.camera.centerCoordinateDistance = newAltitude
    }
}
