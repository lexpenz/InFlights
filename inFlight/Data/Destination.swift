//
//  Recommendation.swift
//  inFlight
//
//  Created by Aleksei Penzentcev on 09/09/2017.
//  Copyright © 2017 lexpenz.com. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper


class Destination: Object, Mappable {
    dynamic var mapIdto = ""
    dynamic var cityTo = ""
    dynamic var price = 0
    dynamic var dTime = 0
    
    var routes = List<Route>()
    
    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        mapIdto <- map["mapIdto"]
        cityTo <- map["cityTo"]
        price <- map["price"]
        dTime <- map["dTime"]
        
        routes <- (map["route"], ListTransform<Route>())
    }
}
