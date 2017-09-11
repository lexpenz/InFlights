//
//  DestinationViewController.swift
//  inFlight
//
//  Created by Aleksei Penzentcev on 05/09/2017.
//  Copyright © 2017 lexpenz.com. All rights reserved.
//

import UIKit
import AlamofireImage

class DestinationViewController: UIViewController {
    fileprivate var recommendation: Destination!
    
    init(recommendation: Destination) {
        super.init(nibName: nil, bundle: nil)
        
        self.recommendation = recommendation
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let destinationView = DestinationView(recommendation: recommendation)
        view = destinationView
        
        destinationView.tableView.dataSource = self
        
        Api.load(imageId: recommendation.mapIdto, success: { image in
            destinationView.imageView.image = image
        }, failure: {
            Log.error("Error loading image")
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK:- UITableViewDataSource
extension DestinationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Log.debug("\(recommendation.routes.count)")
        return recommendation.routes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RouteTableViewCell.identifier, for: indexPath) as! RouteTableViewCell
        
        cell.setup(with: recommendation.routes[indexPath.row])
        
        return cell
    }
}
