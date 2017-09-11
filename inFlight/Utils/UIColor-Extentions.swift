//
//  UIColor-Extentions.swift
//  inFlight
//
//  Created by Aleksei Penzentcev on 10/09/2017.
//  Copyright © 2017 lexpenz.com. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alphaComponent: CGFloat = 1.0) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alphaComponent)
    }
    
    convenience init(hexInt: Int) {
        self.init(red: (hexInt >> 16) & 0xff, green:(hexInt >> 8) & 0xff, blue:hexInt & 0xff)
    }
    
    convenience init(hexInt: Int, alpha: CGFloat) {
        self.init(red: (hexInt >> 16) & 0xff, green:(hexInt >> 8) & 0xff, blue:hexInt & 0xff, alphaComponent: alpha)
    }
}
