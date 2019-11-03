//
//  JSONEmit.swift
//  Guardian_Dashboard-Mobile
//
//  Created by Andrew Struck-Marcell on 11/2/19.
//  Copyright © 2019 Andrew Struck-Marcell. All rights reserved.
//

import Foundation

/*{
    'UUID' : 'xxxx-xxxxx-xxxxxxxx',
    ‘LTE’  :  {
        connectionStatus : ‘online’,
        signal_strength : ’20’,
        provider : ‘AT&T’,
    },
    'BLE’ : [
            { ‘device_name’ : ‘headphones_xyz’ , ‘connection_strength’ : ’30’, ‘bluetooth_mode’ : ‘classic’},
            { ‘device_name’ : ‘radio_3’ , ‘connection_strength’ : ’90’, ‘bluetooth_mode’ : ‘BLEv4.2’}
    ],
    ‘NFC’ : {
        data_transmitted : [
            {‘payload’ : ‘obj’ , ’timestamp’ : ‘123124123’},
            {‘payload’ : ‘obj’ , ’timestamp’ : ‘123124123’},
            {‘payload’ : ‘obj’ , ’timestamp’ : ‘123124123’}
         ]
    },
    ‘HRD_ENC' : {
        ‘encryption_status’ : ‘on'
    },
    ‘VPN' : {
        ‘current_connection' : { ‘connection_name’ : ‘openVPN_123’ , ’timestamp’ : ‘123123123123’ },
        ‘recent_connection’ : [
            { ‘connection_name’ : ‘openVPN_321’, ’timestamp’ : ‘321321321’ },
            { ‘connection_name’ : ‘openVPN_322’, ’timestamp’ : ‘321323222’ },
            { ‘connection_name’ : ‘openVPN_324’, ’timestamp’ : ‘321324323’ }
        ]
    },
    ‘WIFI’ : {
        ‘current_connection' : { ‘wifi_name’ : ’Starbucks’ , ’timestamp’ : ‘123123123123’, ‘connection_strength’ : ’25’, ’security’ : ‘WP2_PSK’, ‘protocol’ : ‘2ghz’ },
        ‘recent_connection’ : [
            { ‘wifi_name’ : ’Google_Campus_public’ , ’timestamp’ : ‘12323232’, ’security’ : ‘WP2_PSK’, ‘protocol’ : ‘2ghz’ },
            { ‘wifi_name’ : ’Starbucks_gg’ , ’timestamp’ : ‘2323223’, ’security’ : ‘WP2_PSK’, ‘protocol’ : ‘5ghz’ },
        ]
    },
    ‘GPS’ : {
        ’gps_status’ : ‘on’,
        ‘current_position’ : { ‘long’ : ’12.3’, ‘lat’ : ’23.3’ },
        ‘gps_type’ : ‘glonass'
    },
    ‘AV’ : {
        ’status’ : ‘on'
    },
    ‘MDM’ : {
        ’status’ : ‘on’,
        ‘profile’ : ‘emergency_xyz'
    }
}
*/

struct DeviceAndSensors: Codable {
    let uuid: String
    let lte: LTE
}

struct LTE: Codable {
    let connectionStatus: String
    let signal_strength: String
    let provider: String
}
