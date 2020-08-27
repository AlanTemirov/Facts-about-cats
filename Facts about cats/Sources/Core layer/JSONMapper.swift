//
//  JSONMapper.swift
//  Facts about cats
//
//  Created by Alan on 26.08.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import Foundation
import CoreData

/// Interface for mapping Json format.
/// As for now used by ManagedObject classes.
protocol Mappable {
    func mapping(json: [String: Any])
}

/// Main purpose is to map Json into `NSManagedObject` models.
class JSONMapper {
    
    private typealias JSON = [String: Any]
    
    @discardableResult
    func mapJSONArray<T: NSManagedObject>(
        data: Data,
        key: String?,
        entityClassName: String,
        context: NSManagedObjectContext
    ) -> [T] {
        let jsonData = data.asJson
        var jsonArray = jsonData as? [JSON]
        if let key = key {
            jsonArray = (jsonData as? JSON)?[key] as? [JSON]
        }
        return jsonArray?.compactMap { element in
            guard
                let description = NSEntityDescription.entity(forEntityName: entityClassName, in: context),
                let entity = NSManagedObject(entity: description, insertInto: context) as? Mappable
                else {
                    return nil
            }
            entity.mapping(json: element)
            return entity as? T
            
            } ?? []
    }
    
}
