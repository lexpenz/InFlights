//
//  Api.swift
//  inFlight
//
//  Created by Aleksei Penzentcev on 05/09/2017.
//  Copyright © 2017 lexpenz.com. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import SwiftyJSON
import ObjectMapper

class Api {
    static func loadDestinations(dateFrom: Date, dateTo: Date, coordinates: Coordinates, success: @escaping (_ json: [String: Any]) -> Void, failure: @escaping (_ error: Error) -> Void) {
        Alamofire.request(Router.popular(dateFrom: dateFrom, dateTo: dateTo, coordinates: coordinates))
            .responseJSON { response in
                if let error = response.error {
                    Log.error("Error loading flights: \(error)")
                    failure(error)
                } else {
                    
                    if let json = response.result.value as? [String: Any] {
                        success(json)
                        
                    }
                }
        }
    }
    
    // MARK:- Images
    static fileprivate let imageDownloader = ImageDownloader(
        configuration: ImageDownloader.defaultURLSessionConfiguration(),
        downloadPrioritization: .fifo,
        maximumActiveDownloads: 4,
        imageCache: AutoPurgingImageCache()
    )

    static func load(imageId: String, success: @escaping (UIImage) -> Void, failure: @escaping () -> Void) {
        Api.imageDownloader.download(Router.photo(imageId)) { response in
            if let image = response.result.value {
                success(image)
            } else {
                failure()
            }
        }
    }
}


