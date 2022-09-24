//
//  WorksData+CoreDataProperties.swift
//  WorkListApp
//
//  Created by Mehmet Kerim ÖZEK on 20.09.2022.
//
//

import Foundation
import CoreData

// Extension for WorksData
extension WorksData {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<WorksData> {
        return NSFetchRequest<WorksData>(entityName: "WorksData")
    }
    
    @NSManaged public var title: String?
    @NSManaged public var detail: String?
    @NSManaged public var done: Bool
    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    
}

extension WorksData : Identifiable {
    
}
