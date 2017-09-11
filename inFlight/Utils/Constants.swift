//
//  UIConstants.swift
//  inFlight
//
//  Created by Aleksei Penzentcev on 05/09/2017.
//  Copyright © 2017 lexpenz.com. All rights reserved.
//

import Foundation
import UIKit

class Constants {
    class var margin: CGFloat { return 30 }
    class var smallMargin: CGFloat { return 10 }
    class var minHeight: CGFloat { return 10 }
    class var defaultCoordinates: Coordinates { return (49.2, 16.61) }
    class var mainImageHeightMultiplier: CGFloat { return 0.5 }
    class var labelCellWidthMultiplier: CGFloat { return 0.45 }
}

extension UIFont {
    open static let title = UIFont.systemFont(ofSize: 25, weight: UIFontWeightBold)
    open static let tableMain = UIFont.systemFont(ofSize: 20, weight: UIFontWeightBold)
}

extension UIColor {
    open static let text = UIColor.black
    open static let title = UIColor.white
    open static let accent = UIColor.white
    open static let theme = UIColor(hexInt: 0x0097a9)
    open static let transparentTheme = UIColor(hexInt: 0x0097a9, alpha: 0.5)
}
