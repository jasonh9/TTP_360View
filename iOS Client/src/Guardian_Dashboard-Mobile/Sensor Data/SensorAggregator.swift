//
//  SensorAggregator.swift
//  Guardian_Dashboard-Mobile
//
//  Created by Andrew Struck-Marcell on 11/2/19.
//  Copyright © 2019 Andrew Struck-Marcell. All rights reserved.
//

import Foundation

class SensorAggregator: NSObject {
    let btService = BTService.btManager
    
    var discoveredBTLEPeripherals: [String] = []
}

extension BTServiceUpdateDelegate {
    func btUpdateResponse() {
        discoveredBTLEPeripherals = btService.discoveredPeripherals
    }
}
