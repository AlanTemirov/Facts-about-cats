//
//  Fact+CoreDataClass.swift
//  Facts about cats
//
//  Created by Alan on 26.08.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Fact)
public class Fact: NSManagedObject, Mappable {
    
    func mapping(json: [String: Any]) {
        guard
            let id = json["_id"] as? String,
            let text = json["text"] as? String,
            let upvotes = json["upvotes"] as? Double
            else {
                return
        }
        
        self.id = id
        self.text = text
        self.upvotes = upvotes
        
        if let user = json["user"] as? [String: Any],
            let userName = user["name"] as? [String: Any],
            let firstUserName = userName["first"] as? String,
            let lastUserName = userName["last"] as? String {
            self.user = firstUserName + " " + lastUserName
        } else {
            self.user = "Unknown"
        }
    }
    
}
