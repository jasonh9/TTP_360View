//
//  Networking.swift
//  Guardian_Dashboard-Mobile
//
//  Created by Andrew Struck-Marcell on 11/2/19.
//  Copyright © 2019 Andrew Struck-Marcell. All rights reserved.
//

import Foundation
import SocketIO

class SocketIOManager: NSObject {
    static let shared = SocketIOManager()
    
    let manager = SocketManager(socketURL: URL(string: "http://192.168.43.30:3001")!, config: [.log(true), .compress])
    var socket: SocketIOClient { return manager.defaultSocket }
    var connected = true
    var btUsers: [BTLE] = []
    var updateInterval: TimeInterval = 5
    
    func connect(withMessage message: String = "default message") {
        addHandlers(message: message)
        socket.connect()
        Timer.scheduledTimer(withTimeInterval: updateInterval, repeats: true) { (timer) in
            self.sendJSON(with: message, connectionStatus: /*connected ? "connected" : "disconnected"*/"connected")
//            connected.toggle()
        }
    }
    
    //TODO: add all values to send here
    func addHandlers(message: String) {
        
        socket.on(clientEvent: .connect) {(d, ack) in
            print("socket connected")
            print("emiting message: \(message)")
            self.socket.emit("register", message)
        }
        
        socket.on(message) { (data, emitter) in
            print("received callback with data: \(data)")
            if let dict = data.first as? NSDictionary, let response = dict["response"] as? String {
                print("can be dict, all keys: \(dict.allKeys), values: \(dict.allValues), value for response key: \(response)")
            }
            
        }
    }
    
    //TODO: send this intially, and when there is any sensor value change
    func sendJSON(with message: String, connectionStatus: String = "connected", newBTLEUsers: [BTLE] = []) {
        //TODO: sending JSON goes here, as message
        let deviceAndSensors = DeviceAndSensors(UUID: message,
                                                LTE: LTE(connectionStatus: connectionStatus, provider: "AT&T"),
                                                BLE: [BTLE(deviceName: "John's iphone", sigStrength: "proximate", btSystem: "BLE"),
                                                      BTLE(deviceName: "ABCDE", sigStrength: "weak", btSystem: "BLE")],
                                                NFC: NFC(status: "off", scans: [NFC.Scan(tagType: "mifare", timestamp: "1572749269"),
                                                                               NFC.Scan(tagType: "ndef", timestamp: "1572749266")]),
                                                HRD_ENC: Encryption(encryptionStatus: "on"),
                                                VPN: VPN(currentConnection: VPN.CurrentConnection(connectionName: "firstNetVPN111", timestamp: "1572749266"),
                                                         recentConnection: [VPN.RecentConnection(connectionName: "firstNetVPN123", timestamp: "1572759266"), VPN.RecentConnection(connectionName: "firstNetVPN161", timestamp: "1572142666")]),
                                                WIFI: WIFI(currentConnection: WIFI.CurrentConnection(connectionName: "starbucks", timestamp: "1572759266", connectionStrength: "23", security: "wp2_psk", networkSystem: "2ghz"),
                                                           recentConnection: [WIFI.RecentConnection(connectionName: "google", timestamp: "157275466", security: "wp2_psk", networkSystem: "2ghz"), WIFI.RecentConnection(connectionName: "topgear", timestamp: "152275466", security: "wp2_psk", networkSystem: "5ghz")]),
                                                GPS: GPS(gpsStatus: "on", currentPosition: GPS.CurrentPosition(long: "12.1738452", lat: "23.83957291")),
                                                AV: AntiVirus(status: "on"),
                                                MDM: MDM(status: "on", profile: "first responder mdm 111"))
            
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted

        do {
            let sendingData = try encoder.encode(deviceAndSensors)
            let dataAsString = String(data: sendingData, encoding: .utf8) ?? "value is nil"
            self.socket.emit("clientData", dataAsString)
            print("sent data, sendingData: \(dataAsString)")
        } catch let e {
            print("error encoding: \(e.localizedDescription)")
        }
    }
            
    func disconnect() {
        socket.disconnect()
    }
    
    
}
