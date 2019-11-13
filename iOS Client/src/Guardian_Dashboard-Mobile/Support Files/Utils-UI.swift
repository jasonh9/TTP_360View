//
//  Utils-UI.swift
//  Guardian_Dashboard-Mobile
//
//  Created by Andrew Struck-Marcell on 11/12/19.
//  Copyright © 2019 Andrew Struck-Marcell. All rights reserved.
//

import UIKit

struct GuardianColors {
    static let guardianGreen = UIColor(red: 37/255, green: 204/255, blue: 76/255, alpha: 1.0)
    static let guardianRed = UIColor(red: 224/255, green: 51/255, blue: 42/255, alpha: 1.0)
    static let guardianDark = UIColor(red: 39/255, green: 40/255, blue: 56/255, alpha: 1.0)
    static let guardianYellow = UIColor(red: 252/255, green: 232/255, blue: 83/255, alpha: 1.0)
    static let guardianGray = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1.0)
}



func overallConnectionStatusText(forSignalStrength signalStrength: OverallSignalStrength) -> NSMutableAttributedString {
    
    let statusText = signalStrength.rawValue
    let mutableString = NSMutableAttributedString(string: (statusText), attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 48)])
    
    let color: UIColor
    switch signalStrength {
    case .strong: color = GuardianColors.guardianGreen
    case .medium: color = GuardianColors.guardianYellow
    case .weak: color = GuardianColors.guardianGray
    case .missingCriticalSignal: color = GuardianColors.guardianRed
    }
    
    mutableString.addAttribute(.foregroundColor, value: color, range: NSRange(location: 0, length: statusText.count))
    return mutableString
}


