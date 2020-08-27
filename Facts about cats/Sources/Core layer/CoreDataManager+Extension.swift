//
//  CoreDataManager+Extension.swift
//  Facts about cats
//
//  Created by Alan on 27.08.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import Foundation

/// Possible coredata errors.
enum CoreDataErrors: Error {
    case requestError(_ error: Error)
    case wrongType
    case unknown
}
