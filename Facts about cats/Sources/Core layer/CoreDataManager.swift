//
//  CoreDataManager.swift
//  Facts about cats
//
//  Created by Alan on 26.08.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import CoreData

/// Interface to work with coredata database.
protocol CoreDataManagerProtocol {
    
    var viewContext: NSManagedObjectContext { get }
    
    var newBackgroundContext: NSManagedObjectContext { get }
    
    func load<T: NSFetchRequestResult>(request: NSFetchRequest<T>) -> Result<[NSManagedObject], CoreDataErrors>
    
    /// Saving in view context.
    func save()
    
    func clearData(entityName: String) throws
    
}

/// To work with coredata.
class CoreDataManager: CoreDataManagerProtocol {
    
    // MARK: - Properties.
    
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    var newBackgroundContext: NSManagedObjectContext {
        persistentContainer.newBackgroundContext()
    }
    
    // MARK: - Private properties.
    
    /// Default name of container.
    private static let defaultPersistentContainerName = "CatsFactsDataModel"
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: persistentContainerName)
        
        container.loadPersistentStores(completionHandler: { _, _ in
            container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        })
        return container
    }()
    
    private let persistentContainerName: String
    
    // MARK: - Life cycle
    
    init(persistentContainerName: String = defaultPersistentContainerName) {
        self.persistentContainerName = persistentContainerName
    }
    
    // MARK: - Main functionality
    
    func save() {
        let context = persistentContainer.viewContext
        guard context.hasChanges else {
            return
        }
        try? context.save()
    }
    
    
    func load<T: NSFetchRequestResult>(request: NSFetchRequest<T>) -> Result<[NSManagedObject], CoreDataErrors> {
        do {
            guard let objects = try persistentContainer.viewContext.fetch(request) as? [NSManagedObject] else {
                
                return .failure(.unknown)
            }
            return .success(objects)
        } catch let error {
            return .failure(.requestError(error))
        }
    }
    
    func clearData(entityName: String) throws {
        do {
            let context = viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            do {
                try context.execute(deleteRequest)
                save()
            } catch let error {
                throw error
            }
        }
    }
    
}
