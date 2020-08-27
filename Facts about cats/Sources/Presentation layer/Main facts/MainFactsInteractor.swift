//
//  MainFactsInteractor.swift
//  Facts about cats
//
//  Created by Alan on 26.08.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import Foundation
import CoreData

class MainFactsInteractor: MainFactsInteractorProtocol {
    
    private let coreDataManager: CoreDataManagerProtocol
    private let networkService: NetworkServiceProtocol
    private lazy var jsonMapper = JSONMapper()
    
    required init(coreDataManager: CoreDataManagerProtocol,
                  networkService: NetworkServiceProtocol) {
        self.coreDataManager = coreDataManager
        self.networkService = networkService
    }
    
    func loadFacts(url: String, completion: @escaping ItemsClosure<[Fact]?, Error?>) {
        networkService.request(path: url) { data, error in
            
            guard error.isNil, let data = data else {
                return completion(nil, error)
            }
            
            DispatchQueue.global(qos: .default).async { [unowned self] in
                
                let context = self.coreDataManager.newBackgroundContext
                
                self.jsonMapper.mapJSONArray(
                    data: data,
                    key: "all",
                    entityClassName: String(describing: Fact.self),
                    context: context
                )
                do {
                    try self.coreDataManager.clearData(entityName: "Fact")
                    try context.save()
                    self.fetchFacts(completion: completion)
                } catch (let error) {
                    completion(nil, error)
                }
            }
            
        }
    }
    
    func fetchFacts(completion: @escaping ItemsClosure<[Fact]?, CoreDataErrors?>) {
        DispatchQueue.global(qos: .default).async { [unowned self] in
            
            let request = NSFetchRequest<Fact>(entityName: "Fact")
            request.sortDescriptors = [
                NSSortDescriptor(key: "text", ascending: true)
            ]
            let fetchedFactsResult = self.coreDataManager.load(request: request)
            switch fetchedFactsResult {
            case .success(let facts):
                guard let facts = facts as? [Fact] else {
                    completion(nil, .wrongType)
                    return
                }
                completion(facts, nil)
            case .failure(let error):
                completion(nil, error)
            }
            
        }
    }
    
}
