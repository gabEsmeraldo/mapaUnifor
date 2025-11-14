//
//  RouteManager.swift
//  MapaUnifor
//
//  Created by Turma01-8 on 14/11/25.
//

import Foundation
import MapKit

class RouteManager: ObservableObject {

    @Published var showingRoute: Bool = false
    @Published var originPoint: CLLocationCoordinate2D = CLLocationCoordinate2D(
        latitude: -3.768171,
        longitude: -38.478447
    )
    @Published var destinationPoint: CLLocationCoordinate2D = CLLocationCoordinate2D(
        latitude: -3.768171,
        longitude: -38.478447
    )
    @Published var route: MKRoute?

    func setOrigin(latitude: Double, longitude: Double) {
        originPoint = CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude
        )
    }
    
    func setDestination(latitude: Double, longitude: Double) {
        destinationPoint = CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude
        )
    }
    
    func getDirections() {
        self.route = nil
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: originPoint))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destinationPoint))
        
        Task {
            let directions = MKDirections(request: request)
            let response = try? await directions.calculate()
            route = response?.routes.first
        }
    }
    
}
