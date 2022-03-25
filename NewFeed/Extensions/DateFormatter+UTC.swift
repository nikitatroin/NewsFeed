//
//  DateFormatter.swift
//  NewFeed
//
//  Created by Никита Троян on 23.12.2021.
//

import UIKit

// MARK: - Форматирование даты/времени а-ля ВК.
extension Double {
    func getRelativeDateStringFromUTC() -> String {
        
        
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
        dateFormatter.doesRelativeDateFormatting = true
 
        
        return dateFormatter.string(from: date)
    }
}

// MARK: - Форматирование даты/времени в соответствие с локалью ru_RU.
extension Double {
    func getDateStringFromUTC() -> String {
        
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        
        return dateFormatter.string(from: date)
    }
}
