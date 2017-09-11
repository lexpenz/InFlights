//
//  DestinationView.swift
//  inFlight
//
//  Created by Aleksei Penzentcev on 05/09/2017.
//  Copyright © 2017 lexpenz.com. All rights reserved.
//

import UIKit
import SnapKit

class DestinationView: UIView {
    let tableView = UITableView()
    
    let imageView = UIImageView()
    let titleLabel = TitleLabel()
    
    let alphaView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        backgroundColor = .theme
        
        addSubview(tableView)
        addSubview(imageView)
        addSubview(alphaView)
        alphaView.addSubview(titleLabel)
        
        tableView.snp.makeConstraints { make in
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.top.equalTo(titleLabel.snp.bottom).offset(Constants.smallMargin)
            make.height.greaterThanOrEqualTo(Constants.minHeight)
            make.bottom.equalTo(self)
        }
        
        imageView.snp.makeConstraints { make in
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.top.equalTo(self)
            make.height.greaterThanOrEqualTo(self.snp.height).multipliedBy(Constants.mainImageHeightMultiplier)
        }
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        alphaView.snp.makeConstraints { make in
            make.left.equalTo(imageView)
            make.right.lessThanOrEqualTo(imageView)
            make.bottom.equalTo(imageView)
        }
        alphaView.backgroundColor = UIColor.transparentTheme
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(alphaView).offset(Constants.smallMargin)
            make.right.equalTo(alphaView).offset(-Constants.smallMargin)
            make.top.equalTo(alphaView).offset(Constants.smallMargin)
            make.bottom.equalTo(alphaView).offset(-Constants.smallMargin)
        }
        titleLabel.adjustsFontSizeToFitWidth = true
        
        tableView.register(RouteTableViewCell.self, forCellReuseIdentifier: RouteTableViewCell.identifier)
    }
    
    convenience init(recommendation: Destination) {
        self.init(frame: CGRect.zero)
        
        titleLabel.text = recommendation.cityTo + " " + NSLocalizedString("for", comment: "") + " " + String(recommendation.price) + " EUR"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
