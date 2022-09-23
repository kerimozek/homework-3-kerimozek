//
//  DetailsModel.swift
//  WorkListApp
//
//  Created by Mehmet Kerim ÖZEK on 22.09.2022.
//

import Foundation
import CoreData

class DetailsModel {
    
    
    func updateData(index: Int){
        
        
        let fetchRequest: NSFetchRequest<WorksData> = WorksData.fetchRequest()
        let sortByDate = NSSortDescriptor(key: #keyPath(WorksData.date), ascending: false)
        fetchRequest.sortDescriptors = [sortByDate]
        do {
            let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
            let results = try context.fetch(fetchRequest)
            if results[index].done == false {
                results[index].setValue(!results[index].done, forKey: #keyPath(WorksData.done))
                AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
            } else {
                return
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
}


