//
//  JSONEmit.swift
//  Guardian_Dashboard-Mobile
//
//  Created by Andrew Struck-Marcell on 11/2/19.
//  Copyright © 2019 Andrew Struck-Marcell. All rights reserved.
//

import Foundation


struct DeviceAndSensors: Codable {
    let UUID: String
    let LTE: LTE
    let BLE: [BTLE]
    let NFC: NFC
    let HRD_ENC: Encryption
    let VPN: VPN
    let WIFI: WIFI
    let GPS: GPS
    let AV: AntiVirus
    let MDM: MDM
}

struct LTE: Codable {
    let connectionStatus: String
    let provider: String
}

struct BTLE: Codable {
    let deviceName: String
    let sigStrength: String
    let btSystem: String

    enum CodingKeys: String, CodingKey {
        case deviceName
        case sigStrength
        case btSystem = "protocol"
    }
}

struct NFC: Codable {
    let status: String
    let scans: [Scan]
    
    struct Scan: Codable {
        let tagType: String
        let timestamp: String
    }
}
    
struct Encryption: Codable {
    let encryptionStatus: String
}

struct VPN: Codable {
    let currentConnection: CurrentConnection
    let recentConnection: [RecentConnection]
    
    struct CurrentConnection: Codable {
        let connectionName: String
        let timestamp: String
    }
    
    struct RecentConnection: Codable {
        let connectionName: String
        let timestamp: String
    }
}

struct WIFI: Codable {
    let currentConnection: CurrentConnection
    let recentConnection: [RecentConnection]

    struct CurrentConnection: Codable {
        let connectionName: String
        let timestamp: String
        let connectionStrength: String
        let security: String
        let networkSystem: String
        
        enum CodingKeys: String, CodingKey {
            case connectionName
            case timestamp
            case connectionStrength
            case security
            case networkSystem = "protocol"
        }
    }
    
    struct RecentConnection: Codable {
        let connectionName: String
        let timestamp: String
        let security: String
        let networkSystem: String
        
        enum CodingKeys: String, CodingKey {
            case connectionName
            case timestamp
            case security
            case networkSystem = "protocol"
        }
    }
}

struct GPS: Codable {
    let gpsStatus: String
    let currentPosition: CurrentPosition
    
    struct CurrentPosition: Codable {
        let long: String
        let lat: String
    }
}

struct AntiVirus: Codable {
    let status: String
}

struct MDM: Codable {
    let status: String
    let profile: String
}


