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
import Network

protocol MonitorsSensorStatusChangeDelegate {
    func changeInStatus()
}

class SensorAggregator: NSObject {
    var updateInterval: TimeInterval = 5
    //Sensor frameworks
    let btService = BTService.btManager
    let locationService = LocationService.sharedInstance
    let cellService = CellularServiceInfo()
    let nfcReader = NFCReader()
    let networkMonitor = NetworkMonitoring.shared
    
    //Sensor data
    var discoveredBTLEPeripherals: [String] = []
    var currentLocation: CLLocation? { return locationService.currentLocation }
    var providerName: String? { return cellService.carrier.carrierName }
    
    var delegate: MonitorsSensorStatusChangeDelegate?
    
    override init() {
        super.init()
    }
    
    func updateTimer() {
        Timer.scheduledTimer(withTimeInterval: updateInterval, repeats: true) { (timer) in
            //TODO: update data here
        }
    }
    
}

extension SensorAggregator: BTServiceUpdateDelegate {
    func btUpdateResponse() {
        print("updating bluetooth")
        discoveredBTLEPeripherals = btService.discoveredPeripherals
    }
    
}
