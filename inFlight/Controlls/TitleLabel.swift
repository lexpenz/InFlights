//
//  TitleLabel.swift
//  inFlight
//
//  Created by Aleksei Penzentcev on 05/09/2017.
//  Copyright © 2017 lexpenz.com. All rights reserved.
//

import UIKit

class TitleLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        font = UIFont.title
        textColor = .title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
