//
//  InfoModel.swift
//  WorkListApp
//
//  Created by Mehmet Kerim ÖZEK on 21.09.2022.
//

import Foundation
import CoreData


class InfoModel {
    
    // Function to Save Data to CoreData
    func saveData(title: String, detail: String) {
        
        let managedContext = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
        let data = WorksData(context: managedContext)
        
        data.setValue(Date(), forKey: #keyPath(WorksData.date))
        data.setValue(title, forKey: #keyPath(WorksData.title))
        data.setValue(detail, forKey: #keyPath(WorksData.detail))
        data.setValue(UUID(), forKey: "id")
        
        AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
        
    }
    
}
