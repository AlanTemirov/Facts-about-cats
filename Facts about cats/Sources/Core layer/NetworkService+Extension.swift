//
//  NetworkService+Extension.swift
//  Facts about cats
//
//  Created by Alan on 27.08.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import Foundation

enum RequestManagerError: Error {
    case invalidPath
}

enum RequestType {
    case get
    case post
}
