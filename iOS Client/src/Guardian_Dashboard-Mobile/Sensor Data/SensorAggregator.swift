//
//  SensorAggregator.swift
//  Guardian_Dashboard-Mobile
//
//  Created by Andrew Struck-Marcell on 11/2/19.
//  Copyright © 2019 Andrew Struck-Marcell. All rights reserved.
//

import Foundation
import CoreBluetooth
import CoreLocation
import CoreTelephony

class SensorAggregator: NSObject {
    //Sensor frameworks
    let btService = BTService.btManager
    let locationService = LocationService.sharedInstance
    let cellService = CellularServiceInfo()
    
    //Sensor data
    var discoveredBTLEPeripherals: [String] = []
    var currentLocation: CLLocation? { return locationService.currentLocation }
}

extension SensorAggregator: BTServiceUpdateDelegate {
    func btUpdateResponse() {
        discoveredBTLEPeripherals = btService.discoveredPeripherals
    }
}
