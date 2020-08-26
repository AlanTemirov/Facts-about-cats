//
//  CoreDataManager.swift
//  Facts about cats
//
//  Created by Alan on 26.08.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import CoreData

enum CoreDataErrors: Error {
    case requestError(_ error: Error)
    case unknown
    
}

protocol CoreDataManagerProtocol {
    
    var viewContext: NSManagedObjectContext { get }
    
    var newBackgroundContext: NSManagedObjectContext { get }
    
    func load(object: NSManagedObject.Type) -> Result<[NSManagedObject], CoreDataErrors>
    
    func save()
    
}

class CoreDataManager: CoreDataManagerProtocol {
    
    private static let defaultPersistentContainerName = "CatsFactsDataModel"
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: persistentContainerName)
        container.loadPersistentStores(completionHandler: { _, _ in })
        return container
    }()
    
    private let persistentContainerName: String
    
    init(persistentContainerName: String = defaultPersistentContainerName) {
        self.persistentContainerName = persistentContainerName
    }
    
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    var newBackgroundContext: NSManagedObjectContext {
        persistentContainer.newBackgroundContext()
    }
    
    func save() {
        let context = persistentContainer.viewContext
        guard context.hasChanges else {
            return
        }
        try? context.save()
    }
    
    func load(object: NSManagedObject.Type) -> Result<[NSManagedObject], CoreDataErrors> {
        do {
            let request = object.fetchRequest()
            guard let objects = try persistentContainer.viewContext.fetch(request) as? [NSManagedObject] else {
                
                return .failure(.unknown)
            }
            return .success(objects)
        } catch let error {
            return .failure(.requestError(error))
        }
    }
}

