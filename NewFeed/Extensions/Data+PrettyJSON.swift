//
//  Data+PrettyJSON.swift
//  NewFeed
//
//  Created by Никита Троян on 14.12.2021.
//

import Foundation
// расшираем класс Data, по сути он наш бинарник
extension Data {
    var prettyJSON: NSString? {
        guard
            let object = try? JSONSerialization.jsonObject(with: self, options: []),
            let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
            let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        else { return nil }
        
        return prettyPrintedString
    }
}

