//
//  Route.swift
//  inFlight
//
//  Created by Aleksei Penzentcev on 10/09/2017.
//  Copyright © 2017 lexpenz.com. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class Route: Object, Mappable {
    dynamic var mapIdfrom = ""
    dynamic var mapIdto = ""
    dynamic var cityTo = ""
    dynamic var cityFrom = ""
    dynamic var price = 0
    dynamic var dTime = 0
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        mapIdfrom <- map["mapIdfrom"]
        mapIdto <- map["mapIdto"]
        cityTo <- map["cityTo"]
        cityFrom <- map["cityFrom"]
        price <- map["price"]
        dTime <- map["dTime"]
    }
}
