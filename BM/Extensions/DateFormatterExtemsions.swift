//
//  DateFormatterExtemsions.swift
//  BM
//
//  Created by NikitaSergeevich on 12/08/2022.
//

import Foundation

extension DateFormatter {
    func decoderDateFormatter() -> DateFormatter{
        
        self.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        self.locale = Locale(identifier: "en_US")
        self.timeZone = TimeZone(secondsFromGMT: 0)
        return self
    }
}
