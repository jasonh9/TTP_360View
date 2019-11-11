//
//  DashboardItemStrength.swift
//  Guardian_Dashboard-Mobile
//
//  Created by Andrew Struck-Marcell on 11/1/19.
//  Copyright © 2019 Andrew Struck-Marcell. All rights reserved.
//

import UIKit

enum DashboardItemType {
    case lte(signalStrength: SignalStrength)
    case btle(connectionStrength: BTLEConnectionStrength)
    case btClassic(pairedStatus: BTClassicPairedStatus)
    case nfc(status: TurnedOnStatus)
    case encryptionStatus(status: TurnedOnStatus)
    case vpn(status: TurnedOnStatus)
    case wifi(signalStrength: SignalStrength)
    case gps(status: TurnedOnStatus)
    case antivirusStatus(status: TurnedOnStatus)
    case mdmStatus(status: TurnedOnStatus)
}

//For WiFi and LTE
enum SignalStrength {
    case noSignal
    case weak
    case medium
    case strong
}

enum BTLEConnectionStrength {
    case turnedOff
    case weak
    case proximate
}

enum BTClassicPairedStatus {
    case paired
    case notPaired
}

//For NFC, hardware encryption, VPN usage, location tracking, antivirus, MDM usage
enum TurnedOnStatus {
    case off
    case on
}

struct DashboardItem {
    static let defaultItems: [DashboardItem] = [DashboardItem(type: .lte(signalStrength: .strong)), DashboardItem(type: .btle(connectionStrength: .proximate)), /*DashboardItem(type: .btClassic(pairedStatus: .notPaired)),*/ DashboardItem(type: .nfc(status: .on)), DashboardItem(type: .encryptionStatus(status: .off)), DashboardItem(type: .vpn(status: .off)), DashboardItem(type: .wifi(signalStrength: .medium)), DashboardItem(type: .gps(status: .on)), DashboardItem(type: .antivirusStatus(status: .off)), DashboardItem(type: .mdmStatus(status: .off))]
    
    let type: DashboardItemType
    var image: UIImage? {
        switch type {
        case .lte(let signalStrength):
            switch signalStrength {
            case .noSignal: return UIImage(named: ImageFileNames.cellNetworkRed)
            case .weak: return UIImage(named: ImageFileNames.cellNetworkGray)
            case .medium: return UIImage(named: ImageFileNames.cellNetworkYellow)
            case .strong: return UIImage(named: ImageFileNames.cellNetworkGreen)
            }
        case .btle(let connectionStrength):
            switch connectionStrength {
            case .proximate: return UIImage(named: ImageFileNames.bluetoothGreen)
            case .turnedOff: return UIImage(named: ImageFileNames.bluetoothRed)
            case .weak: return UIImage(named: ImageFileNames.bluetoothYellow)
            }
        case .btClassic(let pairedStatus): return UIImage(named: ImageFileNames.bluetoothRed)
        case .nfc(let status):
            switch status {
            case .off: return UIImage(named: ImageFileNames.nfcRed)
            case .on: return UIImage(named: ImageFileNames.nfcGreen)
            }
        case .encryptionStatus(let status):
            switch status {
            case .off: return UIImage(named: ImageFileNames.encryptionRed)
            case .on: return UIImage(named: ImageFileNames.encryptionGreen)
            }
        case .vpn(let status):
            switch status {
            case .off: return UIImage(named: ImageFileNames.vpnGray)
            case .on: return UIImage(named: ImageFileNames.vpnBlack)
            }
        case .wifi(let signalStrength):
            switch signalStrength {
            case .noSignal: return UIImage(named: ImageFileNames.wifiRed)
            case .weak: return UIImage(named: ImageFileNames.wifiGray)
            case .medium: return UIImage(named: ImageFileNames.wifiYellow)
            case .strong: return UIImage(named: ImageFileNames.wifiGreen)
            }
        case .gps(let status):
            switch status {
            case .off: return UIImage(named: ImageFileNames.gpsRed)
            case .on: return UIImage(named: ImageFileNames.gpsGreen)
            }
        case .antivirusStatus(let status):
            switch status {
            case .off: return UIImage(named: ImageFileNames.antivirusRed)
            case .on: return UIImage(named: ImageFileNames.antivirusGreen)
            }
        case .mdmStatus(let status):
            switch status {
            case .off: return UIImage(named: ImageFileNames.mdmGray)
            case .on: return UIImage(named: ImageFileNames.mdmBlack)
            }
        }
    }
    
    var name: String {
        switch type {
        case .lte: return "4G"
        case .btle: return "Bluetooth"
        case .btClassic: return "BT Classic"
        case .nfc: return "NFC"
        case .encryptionStatus: return "Encryption"
        case .vpn: return "VPN"
        case .wifi: return "WiFi"
        case .gps: return "GPS"
        case .antivirusStatus: return "AntiVirus"
        case .mdmStatus: return "MDM"
        }
    }
}
