//
//  LocationManager.swift
//  UberClone
//
//  Created by Fahad Sheikh on 2024-01-21.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()

    override init() {
        super.init()

        locationManager.delegate = self
        
        // gives most accurate location
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // this requests the app
        locationManager.requestWhenInUseAuthorization()
        // updates
        locationManager.startUpdatingLocation()
        
    }
}




extension LocationManager: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard !locations.isEmpty else { return }
        locationManager.stopUpdatingLocation()
    }
}
