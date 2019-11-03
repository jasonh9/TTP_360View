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
    
    func connect(withMessage message: String = "default message") {
        addHandlers(message: message)
        socket.connect()
    }
    
    //TODO: add all values to send here
    func addHandlers(message: String) {
        
        socket.on(clientEvent: .connect) {(d, ack) in
            print("socket connected")
            print("emiting message: \(message)")
            self.socket.emit("register", message)
        }
        
        socket.on(message) {[weak self] (data, emitter) in
            print("received callback with data: \(data)")
            if let dict = data.first as? NSDictionary, let response = dict["response"] as? String, response == ServerResponse.alreadyRegistered {
                print("can be dict, all keys: \(dict.allKeys), values: \(dict.allValues), value for response key: \(dict["response"])")
                self?.sendJSON(with: message)
            }
            
        }
    }
    
    func sendJSON(with message: String) {
        //TODO: sending JSON goes here, as message
        let deviceAndSensors = DeviceAndSensors(uuid: message, lte: LTE(connectionStatus: "connected", signal_strength: "strong", provider: "AT&T"))
        
        let encoder = JSONEncoder()
//        encoder.outputFormatting = .prettyPrinted

        do {
            let sendingData = try encoder.encode(deviceAndSensors)
            let dataAsString = String(data: sendingData, encoding: .utf8) ?? "value is nil"
            self.socket.emit("clientData", sendingData)
            print("sent data")
        } catch let e {
            print(e.localizedDescription)
        }
    }
    
    func parse(response: [String: Any])  {
        
    }
        
    func disconnect() {
        socket.disconnect()
    }
    
    
}
