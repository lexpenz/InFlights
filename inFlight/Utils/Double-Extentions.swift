//
//  Double-Extentions.swift
//  inFlight
//
//  Created by Aleksei Penzentcev on 11/09/2017.
//  Copyright © 2017 lexpenz.com. All rights reserved.
//

import Foundation

extension Double {
    func roundToDecimal(_ fractionDigits: Int) -> Double {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * multiplier) / multiplier
    }
}
