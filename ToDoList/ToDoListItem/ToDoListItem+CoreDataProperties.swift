//
//  ToDoListItem+CoreDataProperties.swift
//  ToDoList
//
//  Created by Berlian on 16/06/22.
//
//

import Foundation
import CoreData


extension ToDoListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListItem> {
        return NSFetchRequest<ToDoListItem>(entityName: "ToDoListItem")
    }

    @NSManaged public var desc: String?
    @NSManaged public var subtitle: String?
    @NSManaged public var title: String?

}

extension ToDoListItem : Identifiable {

}
