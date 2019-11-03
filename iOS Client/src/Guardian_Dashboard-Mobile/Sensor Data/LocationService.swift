//
//  LocationService.swift
//  Guardian_Dashboard-Mobile
//
//  Created by Andrew Struck-Marcell on 11/2/19.
//  Copyright © 2019 Andrew Struck-Marcell. All rights reserved.
//

import Foundation
import CoreLocation


class LocationService: NSObject {
    static let sharedInstance = LocationService()
    let manager = CLLocationManager()
    var currentLocation: CLLocation?
    
    func getAuthorization() {
        manager.requestAlwaysAuthorization()
    }
    
    private override init() {
        super.init()
        manager.delegate = self
    }
}

extension LocationService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways:
            manager.startUpdatingLocation()
        case .authorizedWhenInUse:
            manager.startUpdatingLocation()
        default: break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        print("updating current location: \(location.coordinate)")
        currentLocation = location
    }
}
