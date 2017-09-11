//
//  Router.swift
//  inFlight
//
//  Created by Aleksei Penzentcev on 10/09/2017.
//  Copyright © 2017 lexpenz.com. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import SwiftyJSON
import ObjectMapper

public typealias Coordinates = (latitude: Double, longitude: Double)

public enum Router: URLRequestConvertible {
    case photo((id: String))
    case popular(dateFrom: Date, dateTo: Date, coordinates: Coordinates)
    
    var baseUrl: String {
        switch self {
        case .photo(_):
            return "https://images.kiwi.com"
        default:
            return "https://api.skypicker.com"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .popular:
            return .get
        case .photo:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .popular(let dateFrom, let dateTo, let coordinates):
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy"
            
            let string = "/flights?v=2&sort=popularity&asc=0&locale=en&children=0&infants=0&flyFrom=\(coordinates.latitude)-\(coordinates.longitude)-250km&to=anywhere&featureName=aggregateResults&dateFrom=\(formatter.string(from: dateFrom))&dateTo=\(formatter.string(from: dateTo))&typeFlight=oneway&one_per_date=0&oneforcity=1&wait_for_refresh=0&adults=1&limit=45"
            return string
        case .photo(let id):
            return "/photos/600/\(id).jpg"
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let parameters = [String: Any]()
        
        let url = try (baseUrl+path).asURL()
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.timeoutInterval = TimeInterval(10 * 1000)
        
        return try URLEncoding.default.encode(request, with: parameters)
    }
}
