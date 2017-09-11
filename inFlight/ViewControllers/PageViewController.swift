//
//  ViewController.swift
//  inFlight
//
//  Created by Aleksei Penzentcev on 05/09/2017.
//  Copyright © 2017 lexpenz.com. All rights reserved.
//

import UIKit
import RealmSwift
import SnapKit

class PageViewController: UIPageViewController {
    fileprivate var pages = [UIViewController]()
    fileprivate var destinations: Results<Destination>!
    
    init(destinations: Results<Destination>, transitionStyle: UIPageViewControllerTransitionStyle, navigationOrientation: UIPageViewControllerNavigationOrientation, options: [String : Any]? = nil) {
        self.destinations = destinations
        
        super.init(transitionStyle: transitionStyle, navigationOrientation: navigationOrientation, options: options)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        
        dataSource = self

        for destination in destinations {
            let page = DestinationViewController(recommendation: destination)
            pages.append(page)
        }
        setViewControllers([pages[0]], direction: .forward, animated: false, completion: nil)
    }
}

// MARK:- UIPageViewControllerDataSource
extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let viewControllerIndex = pages.index(of: viewController) {
            if viewControllerIndex == 0 {
                return pages.last
            } else {
                return pages[viewControllerIndex - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let viewControllerIndex = pages.index(of: viewController) {
            if viewControllerIndex < pages.count - 1 {
                return pages[viewControllerIndex + 1]
            } else {
                return pages.first
            }
        }
        return nil
    }
}

// MARK:- PageControl
extension PageViewController {
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
