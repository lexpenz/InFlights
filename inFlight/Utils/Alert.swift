//
//  Alerts.swift
//  inFlight
//
//  Created by Aleksei Penzentcev on 11/09/2017.
//  Copyright © 2017 lexpenz.com. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    static var noInternet: UIAlertController {
        get {
            let alert = UIAlertController(title: NSLocalizedString("Error!!!", comment: "") , message: NSLocalizedString("Something went wrong! (Or you just don't have Internet)", comment: ""), preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            return alert
        }
    }
}
