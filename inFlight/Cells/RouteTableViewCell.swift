//
//  RouteTableViewCell.swift
//  inFlight
//
//  Created by Aleksei Penzentcev on 10/09/2017.
//  Copyright © 2017 lexpenz.com. All rights reserved.
//

import Foundation
import UIKit

class RouteTableViewCell: UITableViewCell {
    static let identifier = "flightCellIdentifier"
    
    let fromLabel = TableMainLabel()
    let toLabel = TableMainLabel()
    let dateLabel = SmallLabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(fromLabel)
        addSubview(toLabel)
        addSubview(dateLabel)
        
        fromLabel.snp.makeConstraints { make in
            make.left.equalTo(self).offset(Constants.smallMargin)
            make.width.equalTo(self.snp.width).multipliedBy(Constants.labelCellWidthMultiplier).offset(-Constants.smallMargin)
            make.top.equalTo(self).offset(Constants.smallMargin)
        }
        fromLabel.adjustsFontSizeToFitWidth = true
        
        toLabel.snp.makeConstraints { make in
            make.right.equalTo(self).offset(-Constants.smallMargin)
            make.width.equalTo(self.snp.width).multipliedBy(Constants.labelCellWidthMultiplier).offset(-Constants.smallMargin)
            make.top.equalTo(fromLabel)
        }
        toLabel.adjustsFontSizeToFitWidth = true
        toLabel.textAlignment = .right
        
        dateLabel.snp.makeConstraints { make in
            make.left.equalTo(fromLabel)
            make.top.equalTo(fromLabel.snp.bottom).offset(Constants.smallMargin)
            make.bottom.equalTo(self).offset(-Constants.smallMargin)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RouteTableViewCell {
    func setup(with route: Route) {
        fromLabel.text = NSLocalizedString("from", comment: "") + " " + route.cityFrom
        toLabel.text = NSLocalizedString("to", comment: "") + " " + route.cityTo
        
        let date = Date(timeIntervalSince1970: Double(route.dTime))
        let formatter = DateFormatter()

        formatter.dateFormat = "dd/MM/yyyy HH:mm"
        dateLabel.text = formatter.string(from: date)
    }
}
