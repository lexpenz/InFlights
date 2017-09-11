//
//  LocationManager.swift
//  inFlight
//
//  Created by Aleksei Penzentcev on 11/09/2017.
//  Copyright © 2017 lexpenz.com. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager {
    static let shared = LocationManager()
    
    fileprivate let locationManager = CLLocationManager()
    
    private init() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    var currentLocation: Coordinates? {
        get {
            if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse && CLLocationManager.locationServicesEnabled() {
                locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
                locationManager.startMonitoringSignificantLocationChanges()
                
                if let latitude = locationManager.location?.coordinate.latitude, let longitude = locationManager.location?.coordinate.longitude {
                    return (latitude: latitude.roundToDecimal(2), longitude: longitude.roundToDecimal(2))
                }
            }
            return nil
        }
    }
}
