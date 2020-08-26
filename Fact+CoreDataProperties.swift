//
//  Fact+CoreDataProperties.swift
//  Facts about cats
//
//  Created by Alan on 26.08.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//
//

import Foundation
import CoreData


extension Fact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Fact> {
        return NSFetchRequest<Fact>(entityName: "Fact")
    }

    @NSManaged public var text: String?
    @NSManaged public var id: String?
    @NSManaged public var upvotes: Double
    @NSManaged public var user: String?

}
