//
//  TableMainLabel.swift
//  inFlight
//
//  Created by Aleksei Penzentcev on 10/09/2017.
//  Copyright © 2017 lexpenz.com. All rights reserved.
//

import Foundation
import UIKit

class TableMainLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        font = UIFont.tableMain
        textColor = .text
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
