//
//  Reachability.swift
//  Guardian_Dashboard-Mobile
//
//  Created by Andrew Struck-Marcell on 11/14/19.
//  Copyright © 2019 Andrew Struck-Marcell. All rights reserved.
//

import Foundation
import SystemConfiguration
import Network
//import NetworkExtension <- this is for iOS < 12.0 (back to 9.0)



class NetworkMonitoring: NSObject {
    static let shared = NetworkMonitoring()
    
    let wifiMonitor = NWPathMonitor(requiredInterfaceType: .wifi)
    let cellularMonitor = NWPathMonitor(requiredInterfaceType: .cellular)
    let ethernetMonitor = NWPathMonitor(requiredInterfaceType: .wiredEthernet)
    
    func setup() {
        wifiMonitor.pathUpdateHandler = { [unowned self] path in
            self.handleWifiUpdates(withPath: path)
        }
        cellularMonitor.pathUpdateHandler = { [unowned self] path in
            self.handleCellularUpdates(withPath: path)
        }
        ethernetMonitor.pathUpdateHandler = { [unowned self] path in
            self.handleEthernetUpdates(withPath: path)
        }
        
        startMonitoring()
    }
    
    func startMonitoring() {
        let wifiQueue = DispatchQueue.global(qos: .background)
        let cellQueue = DispatchQueue.global(qos: .background)
        let ethernetQueue = DispatchQueue.global(qos: .background)
        
        wifiMonitor.start(queue: wifiQueue)
        cellularMonitor.start(queue: cellQueue)
        ethernetMonitor.start(queue: ethernetQueue)
    }
    
    func stopMonitoring() {
        //"Note that at the present time once we have called cancel on our NWPathMonitor we cannot start it again."
    }
    
    private func handleWifiUpdates(withPath path: NWPath) {
        switch path.status {
        case .satisfied: print("Wifi status is good")
        case .requiresConnection: print("Wifi status needs to be connected to be good")
        case .unsatisfied: print("Wifi status is unsatisfied")
        @unknown default: print("WiFi path status is a new value")
        }
    }
    
    private func handleCellularUpdates(withPath path: NWPath) {
        switch path.status {
        case .satisfied: print("Cell status is good")
        case .requiresConnection: print("Cell status needs to be connected to be good")
        case .unsatisfied: print("Cell status is unsatisfied")
        @unknown default: print("Cell path status is a new value")
        }
    }
    
    private func handleEthernetUpdates(withPath path: NWPath) {
        switch path.status {
        case .satisfied: print("Ethernet status is good")
        case .requiresConnection: print("Ethernet status needs to be connected to be good")
        case .unsatisfied: print("Ethernet status is unsatisfied")
        @unknown default: print("Ethernet path status is a new value")
        }
    }
}
