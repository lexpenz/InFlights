//
//  Log.swift
//  inFlight
//
//  Created by Aleksei Penzentcev on 09/09/2017.
//  Copyright © 2017 lexpenz.com. All rights reserved.
//

import Foundation
import XCGLogger

internal var Log: XCGLogger = {
    let logger = XCGLogger.default
    logger.setup(level: .debug, showFunctionName: false, showThreadName: true, showLevel: false, showFileNames: false, showLineNumbers: false, writeToFile: nil, fileLevel: .debug)
    return logger
}()
