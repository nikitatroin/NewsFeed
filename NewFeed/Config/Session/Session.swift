//
//  Session.swift
//  NewFeed
//
//  Created by Никита Троян on 11.12.2021.
//

import Foundation
import SwiftKeychainWrapper

final class Session {
    private init() {}
    
    static let shared = Session()
    
    var token: String {
        set {
            KeychainWrapper.standard.set(newValue, forKey: "token")
        }
        get {
            KeychainWrapper.standard.string(forKey: "token") ?? ""
        }
    }
    
    var userId: String {
        set {
            UserDefaults.standard.set(newValue, forKey: "userId")
        }
        get {
            UserDefaults.standard.string(forKey: "userId") ?? ""
        }
    }
    
}
