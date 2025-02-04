//
//  UserDefaults+Extension.swift
//  Healexa
//
//  Created by Karthik.Kurdekar on 04/02/25.
//

import Foundation

/// UserDefaults extension to support key/value pairs specific to HappiestHealth app.
extension UserDefaults {
    
    // Static vars represent key/value pair in user defaults
    @UserDefaultsBacked(key: UserDefaultKey.isOnboardingCompleted, defaultValue: false)
    static var isOnboardingCompleted
    
}

// This extension defines all user default properties used in the app in an enum. It also makes use of property wrapper for easy way to set/get the values from standard user defaults.
fileprivate extension UserDefaults {
    
    // Enum to define all user defaults keys used in the app
    enum UserDefaultKey: String, CaseIterable {
        /// Track whether introduction screen viewed or not
        case isOnboardingCompleted
    }
    
    // Property wrapper to set/get user defaults
    @propertyWrapper
    struct UserDefaultsBacked<Value> {
        let defaults = UserDefaults.standard
        var key: UserDefaultKey
        var defaultValue: Value
        
        var wrappedValue: Value {
            get {
                return defaults.value(forKey: key.rawValue) as? Value ?? defaultValue
            }
            set {
                defaults.setValue(newValue, forKey: key.rawValue)
            }
        }
    }
}
