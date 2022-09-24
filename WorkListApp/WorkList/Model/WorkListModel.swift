//
//  WorkListModel.swift
//  WorkListApp
//
//  Created by Mehmet Kerim ÖZEK on 19.09.2022.
//

import Foundation
import CoreData

// Protocol for WorkListModel
protocol WorkListModelProtocol: AnyObject {
    func didGetDataFinish(_ isFinish: Bool)
}

class WorkListModel {
    
    // Defining Constants and Variables
    weak var delegate: WorkListModelProtocol?
    var posts: [WorkEntity] = []
    
    // Function to Get Data from CoreData
    func getData() {
        
        let fetchRequest: NSFetchRequest<WorksData> = WorksData.fetchRequest()
        let sortByDate = NSSortDescriptor(key: #keyPath(WorksData.date), ascending: false)
        fetchRequest.sortDescriptors = [sortByDate]
        do {
            let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
            let results = try context.fetch(fetchRequest)
            posts = results.map {
                WorkEntity(title: $0.title, detail: $0.detail, isDone: $0.done, id: $0.id)
            }
            self.delegate?.didGetDataFinish(true)
        } catch {
            self.delegate?.didGetDataFinish(false)
            print(error.localizedDescription)
        }
    }
}
