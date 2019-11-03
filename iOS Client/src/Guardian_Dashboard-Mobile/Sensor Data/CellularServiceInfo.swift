//
//  CellularServiceInfo.swift
//  Guardian_Dashboard-Mobile
//
//  Created by Andrew Struck-Marcell on 11/2/19.
//  Copyright © 2019 Andrew Struck-Marcell. All rights reserved.
//

import Foundation
import CoreTelephony

class CellularServiceInfo: NSObject {
    let carrier = CTCarrier()
    let networkInfo = CTTelephonyNetworkInfo()
    let cellDataAccessInfo = CTCellularData()
    
}

extension CellularServiceInfo: CTTelephonyNetworkInfoDelegate {
    func dataServiceIdentifierDidChange(_ identifier: String) {
        print("data service identifier changed, identifier is: \(identifier)")
    }
    
}
