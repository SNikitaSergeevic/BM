//
//  IntExtensions.swift
//  BM
//
//  Created by NikitaSergeevich on 29/09/2022.
//

import Foundation

extension Int {
    func getWeekDay() -> String {
        var weekDay: String = ""
        
        //пн вт ср чт пт сб вс
        
        switch self {
        case 2:
            weekDay = "пн"
        case 3:
            weekDay = "вт"
        case 4:
            weekDay = "ср"
        case 5:
            weekDay = "чт"
        case 6:
            weekDay = "пт"
        case 7:
            weekDay = "сб"
        case 1:
            weekDay = "вс"
        default:
            weekDay = "0"
        }
        
        return weekDay
    }
}
