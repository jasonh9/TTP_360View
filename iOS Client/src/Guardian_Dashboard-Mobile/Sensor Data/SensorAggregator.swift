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
import CoreNFC

protocol MonitorsSensorStatusChangeDelegate {
    func changeInStatus()
}

class SensorAggregator: NSObject {
    //Sensor frameworks
    let btService = BTService.btManager
    let locationService = LocationService.sharedInstance
    let cellService = CellularServiceInfo()
    let nfcReader = NFCReader()
    
    //Sensor data
    var discoveredBTLEPeripherals: [String] = []
    var currentLocation: CLLocation? { return locationService.currentLocation }
    var providerName: String? { return cellService.carrier.carrierName }
    
    var delegate: MonitorsSensorStatusChangeDelegate?
    
}

extension SensorAggregator: BTServiceUpdateDelegate {
    func btUpdateResponse() {
        print("updating bluetooth")
        discoveredBTLEPeripherals = btService.discoveredPeripherals
    }
    
}
