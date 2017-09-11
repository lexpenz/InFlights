//
//  UserDefaultsHelper.swift
//  inFlight
//
//  Created by Aleksei Penzentcev on 10/09/2017.
//  Copyright © 2017 lexpenz.com. All rights reserved.
//

import Foundation

fileprivate let UserDefaultsKeyDestinations = "UserDefaultsKeyDestinations"
fileprivate let UserDefaultsKeyDate = "UserDefaultsKeyDate"

extension UserDefaults {
    internal static func save(destinations: [Destination]) {
        var names = [String]()
        for destination in destinations {
            names.append(destination.cityTo)
        }
        
        UserDefaults.standard.set(names, forKey: UserDefaultsKeyDestinations)
    }
    
    internal static func getDestinations() -> [String] {
        let names = UserDefaults.standard.array(forKey: UserDefaultsKeyDestinations) as? [String]
        return names ?? [String]()
    }
    
    internal static func save(date: Date) {
        UserDefaults.standard.set(date, forKey: UserDefaultsKeyDate)
    }
    
    internal static func isTodaySaved() -> Bool {
        if let date = UserDefaults.standard.object(forKey: UserDefaultsKeyDate) as? Date {
            let order = Calendar.current.compare(date, to: Date(), toGranularity: .day)
            if order == .orderedSame {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
}
