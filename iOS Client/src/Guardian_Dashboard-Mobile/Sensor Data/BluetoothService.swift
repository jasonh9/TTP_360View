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
    var discoveredPeripherals: [String] = []
    var centralIsOn = false
    var peripheralManagerIsOn = false
    
    let serviceUUID: CBUUID = CBUUID(string: "499f2d6a-0672-4df2-9bb7-a330b87ab466")
    
    func setup() {
        centralManager = CBCentralManager(delegate: self, queue: .main, options: [:])
        peripheralManager = CBPeripheralManager(delegate: self, queue: nil, options: [:])

        Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { [unowned self] (timer) in
            self.updater()
        }
//        addService()
//        startBroadcasting()
    }
    
    func updater() {
        if centralIsOn {
            centralManager.scanForPeripherals(withServices: [serviceUUID], options: nil)
        }
        
        delegate?.btUpdateResponse()
    }
    
    func startBroadcasting() {
        peripheralManager.stopAdvertising()
//        addService()
        
        if peripheralManagerIsOn {
            peripheralManager.startAdvertising([CBAdvertisementDataServiceUUIDsKey : [serviceUUID]])
        }
    }
    
    func addService() {
        let service = CBMutableService(type: serviceUUID, primary: true)
        let characteristic = CBMutableCharacteristic(type: CBUUID(string: "aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa"), properties: .read, value: nil, permissions: .readable)
        service.characteristics = [characteristic]
        
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
            centralManager.stopScan()
        case .poweredOn:
            centralIsOn = true
            centralManager.scanForPeripherals(withServices: [serviceUUID], options: nil)
        @unknown default:
            break
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        guard let name = peripheral.name else { return }
        if !discoveredPeripherals.contains(name) {
            print("appending to discoveredPeripherals, which currently has count: \(discoveredPeripherals.count)")
            discoveredPeripherals.append(name)
        }

        central.connect(peripheral, options: nil)
        

    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        peripheral.discoverServices([serviceUUID])
        peripheral.readRSSI()
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        print("didDisconnect with peripheral: \(String(describing: peripheral.name))")
    }
    
    
}

extension BTService: CBPeripheralDelegate {
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        guard let services = peripheral.services else { return }
        for service in services {
            if service.characteristics != nil {
                peripheral.discoverCharacteristics(nil, for: service)
            }
        }
    }
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
            peripheral.stopAdvertising()
        case .poweredOn:
            peripheralManagerIsOn = true
            addService()
            startBroadcasting()
        @unknown default:
            break
        }
    }
    
    func peripheralManagerDidStartAdvertising(_ peripheral: CBPeripheralManager, error: Error?) {
        print("did start advertising")
    }
    
    
    
    
    
}
