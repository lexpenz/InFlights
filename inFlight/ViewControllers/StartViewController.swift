//
//  StartViewController.swift
//  inFlight
//
//  Created by Aleksei Penzentcev on 11/09/2017.
//  Copyright © 2017 lexpenz.com. All rights reserved.
//

import UIKit
import RealmSwift
import PKHUD

class StartViewController: UIViewController {
    fileprivate let realm = Realm.defaultRealm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .theme
        
        guard let realm = realm else { return }
        
        
        if realm.objects(Destination.self).count == 0 || !UserDefaults.isTodaySaved() {
            showSpinner()
            _ = LocationManager.shared
        
            var dateOffset = DateComponents()
            dateOffset.day = 7
            let dateFrom = NSCalendar.current.date(byAdding: dateOffset, to: Date())!
            dateOffset.month = 1
            let dateTo = NSCalendar.current.date(byAdding: dateOffset, to: Date())!
            
            let coordinates = LocationManager.shared.currentLocation ?? Constants.defaultCoordinates
            
            Api.loadDestinations(dateFrom: dateFrom, dateTo: dateTo, coordinates: coordinates, success: { [unowned self] json in
                self.process(json: json)
                UserDefaults.save(date: Date())
                
                self.hideSpinner()
                
                self.loadPages()
                
            }, failure: { [unowned self] _ in
                self.hideSpinner()
                self.present(Alert.noInternet, animated: true, completion: nil)
            })
        } else {
            loadPages()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    fileprivate func process(json: [String: Any]) {
        guard let realm = realm else { return }
        do {
            try realm.write {
                realm.deleteAll()
            }
            
            if let data = json["data"] as? [Any] {
                let shownDestinations = UserDefaults.getDestinations()
                
                for destination in data {
                    let dest = Destination(JSON: destination as! [String: Any])
                    
                    if !shownDestinations.contains(dest!.cityTo) {
                        try realm.write {
                            realm.add(dest!)
                        }
                        
                        if realm.objects(Destination.self).count == 5 {
                            break
                        }
                    }
                }
                UserDefaults.save(destinations: Array(realm.objects(Destination.self)))
            }
        }
        catch let error as NSError {
            Log.error("Error processing JSON: \(error)")
        }
    }
}

// MARK:- Loader
extension StartViewController {
    fileprivate func loadPages() {
        guard let realm = realm else { return }
        let destinations = realm.objects(Destination.self)
        let viewController = PageViewController(destinations: destinations, transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        UIApplication.shared.keyWindow?.rootViewController = viewController
    }
}

// MARK:- PKHUD
extension StartViewController {
    fileprivate func showSpinner() {
        DispatchQueue.main.async {
            PKHUD.sharedHUD.contentView = PKHUDSystemActivityIndicatorView()
            PKHUD.sharedHUD.show()
        }
    }
    
    fileprivate func hideSpinner() {
        DispatchQueue.main.async {
            PKHUD.sharedHUD.contentView = PKHUDSystemActivityIndicatorView()
            PKHUD.sharedHUD.hide()
        }
    }
}
