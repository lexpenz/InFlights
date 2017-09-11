//
//  ListTransform.swift
//  inFlight
//
//  Created by Aleksei Penzentcev on 10/09/2017.
//  Copyright © 2017 lexpenz.com. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class ListTransform<T:RealmSwift.Object> : TransformType where T:Mappable {
    typealias Object = List<T>
    typealias JSON = [AnyObject]
    
    let mapper = Mapper<T>()
    
    func transformFromJSON(_ value: Any?) -> Object? {
        let results = List<T>()
        if let objects = mapper.mapArray(JSONObject: value) {
            for object in objects {
                results.append(object)
            }
        }
        return results
    }
    
    func transformToJSON(_ value: Object?) -> JSON? {
        var results = [AnyObject]()
        if let value = value {
            for obj in value {
                let json = mapper.toJSON(obj)
                results.append(json as AnyObject)
            }
        }
        return results
    }
}
