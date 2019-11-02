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
    
    func connect() {
        socket.on(clientEvent: .connect) {data, ack in
            print("socket connected")
        }

        socket.on("currentAmount") {[weak self] data, ack in
            guard let cur = data[0] as? Double else { return }
            
            self?.socket.emitWithAck("canUpdate", cur).timingOut(after: 0) {[weak self] data in
                self?.socket.emit("update", ["amount": cur + 2.50])
            }

            ack.with("Got your currentAmount", "dude")
        }

        socket.connect()
    }
    
    func disconnect() {
        socket.disconnect()
    }
}
