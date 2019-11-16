//
//  OverallSignalStrength.swift
//  Guardian_Dashboard-Mobile
//
//  Created by Andrew Struck-Marcell on 11/12/19.
//  Copyright © 2019 Andrew Struck-Marcell. All rights reserved.
//

import Foundation

enum OverallSignalStrength: String {
    case strong = "Robust"
    case medium = "Adequete"
    case weak = "Weak"
    case missingCriticalSignal = "Critical"
}

enum SensorPriority: Int {
    case essential = 8
    case important = 4
    case lessImportant = 1
    case notRelevant = 0
}

//TODO: get priority and invoke this from Menu sliders.
//1. This needs to be re-calculated every time user changes a slider or checkbox, and every time a sensor input changes
func calculateOverallSignalStrength(from priorityItems: [(item: DashboardItem, priority: SensorPriority)]) -> OverallSignalStrength {
    var numSensorsConsidered = 9
    var rawSignalStrengthScore: Float = 0
    for pItem in priorityItems {
        if pItem.priority == .essential && pItem.item.type.strength == 0.0 {
            return .missingCriticalSignal
        }
        if pItem.priority == .notRelevant {
            numSensorsConsidered -= 1
        }
        rawSignalStrengthScore += Float(pItem.item.type.strength) * Float(pItem.priority.rawValue)
    }
    
    let score: Float = rawSignalStrengthScore / Float(numSensorsConsidered)
    switch score {
    case let s where s > 4.0: return .strong
    case let s where s > 1.0 && s < 4.0: return .medium
    case let s where s > 0.0: return .weak
    default: return .weak
    }
}

func convert(prioritySliderValue value: Float) -> SensorPriority {
    switch value {
    case let v where v > 0.85: return .essential
    case let v where v < 0.85 && v > 0.5: return .important
    case let v where v < 0.5 && v > 0.0: return .lessImportant
    case let v where v == 0.0: return .notRelevant
    default: return .lessImportant
    }
}
