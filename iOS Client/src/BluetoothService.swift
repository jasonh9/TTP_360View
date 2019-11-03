//
//  BluetoothService.swift
//  Guardian_Dashboard-Mobile
//
//  Created by Andrew Struck-Marcell on 11/2/19.
//  Copyright © 2019 Andrew Struck-Marcell. All rights reserved.
//

import Foundation
import CoreBluetooth

protocol BTServiceUpdateDelegate {
    func btUpdateResponse()
}

class BTService: NSObject {
    static let btManager = BTService()
    
    var centralManager: CBCentralManager!
    var peripheralManager: CBPeripheralManager!
    var delegate: BTServiceUpdateDelegate?
    
    let serviceUUID: CBUUID = CBUUID(string: "499f2d6a-0672-4df2-9bb7-a330b87ab466")
    
    func setup() {
        centralManager = CBCentralManager(delegate: self, queue: .main, options: [:])
        peripheralManager = CBPeripheralManager(delegate: self, queue: nil, options: [:])

        Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { [unowned self] (timer) in
            self.updater()
        }
        addService()
    }
    
    func updater() {
        delegate?.btUpdateResponse()
        centralManager.scanForPeripherals(withServices: [serviceUUID], options: nil)
    }
    
    func addService() {
        let service = CBMutableService(type: serviceUUID, primary: true)
        service.characteristics = []
        
        peripheralManager.add(service)
    }
}

extension BTService: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .unknown:
            break
        case .resetting:
            break
        case .unsupported:
            break
        case .unauthorized:
            break
        case .poweredOff:
            break
        case .poweredOn:
            centralManager.scanForPeripherals(withServices: [serviceUUID], options: nil)
        @unknown default:
            break
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        <#code#>
    }
    
    
}

extension BTService: CBPeripheralDelegate {
    
}

extension BTService: CBPeripheralManagerDelegate {
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        switch peripheral.state {
        case .unknown:
            break
        case .resetting:
            break
        case .unsupported:
            break
        case .unauthorized:
            break
        case .poweredOff:
            break
        case .poweredOn:
            peripheralManager.
        @unknown default:
            <#code#>
        }
    }
    
    
}
