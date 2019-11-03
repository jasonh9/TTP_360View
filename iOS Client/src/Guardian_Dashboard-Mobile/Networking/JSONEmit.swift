//
//  JSONEmit.swift
//  Guardian_Dashboard-Mobile
//
//  Created by Andrew Struck-Marcell on 11/2/19.
//  Copyright © 2019 Andrew Struck-Marcell. All rights reserved.
//

import Foundation

/*{
  "UUID": "297b42a9-9e31-43db-b436-f7b61a55688a",
  "LTE": {
    "provider": "first net",
    "connectionStatus": "disconnected"
  },
  "BLE": [
    {
      "deviceName": "Headphonexyz",
      "sigStrength": "20",
      "protocol": "BLE"
    },
    {
      "deviceName": "smart ring",
      "sigStrength": "10",
      "protocol": "Classic"
    }
  ],
  "NFC": {
    "status": "on",
    "scans": [
      {
        "tagType": "mifare",
        "timestamp": "1572749269"
      },
      {
        "tagType": "ndef",
        "timestamp": "1572749266"
      }
    ]
  },
  "HRD_ENC": {
    "encryptionStatus": "on"
  },
  "VPN": {
    "currentConnection": {
      "connectionName": "firstNetVPN111",
      "timestamp": "1572749266"
    },
    "recentConnection": [
      {
        "connectionName": "firstNetVPN123",
        "timestamp": "1572759266"
      },
      {
        "connectionName": "firstNetVPN161",
        "timestamp": "1572142666"
      }
    ]
  },
  "WIFI": {
    "currentConnection": {
      "connectionName": "starbucks",
      "timestamp": "1572759266",
      "connectionStrength": "23",
      "security": "wp2_psk",
      "protocol": "2ghz"
    },
    "recentConnection": [
      {
        "connectionName": "google",
        "timestamp": "157275466",
        "security": "wp2_psk",
        "protocol": "2ghz"
      },
      {
        "connectionName": "topgear",
        "timestamp": "152275466",
        "security": "wp2_psk",
        "protocol": "5ghz"
      }
    ]
  },
  "GPS": {
    "gpsStatus": "on",
    "currentPosition": {
      "long": "12",
      "lat": "23"
    }
  },
  "AV": {
    "status": "on"
  },
  "MDM": {
    "status": "on",
    "profile": "first responder mdm 111"
  }
}
*/

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


