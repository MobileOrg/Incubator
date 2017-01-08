//
//  LogbookItem+Extension.swift
//  Swift-Org-PoC
//
//  Created by Mario Martelli on 08.01.17.
//  Copyright © 2017 Schnuddel Huddel. All rights reserved.
//

import Foundation
import CoreData

extension LogbookItem {
  class func create(with state: String,  in moc: NSManagedObjectContext) -> LogbookItem {

    let logbookItem = NSEntityDescription.insertNewObject(forEntityName: NSStringFromClass(LogbookItem.self), into: moc) as! LogbookItem

    logbookItem.state = state
    
    return logbookItem
  }

  class func with(title: String, in moc: NSManagedObjectContext) -> TodoState? {
    let fetchRequest = NSFetchRequest<TodoState>(entityName: "TodoState")
    fetchRequest.predicate = NSPredicate (format: "title == %@", title)
    do {
      let todoKeywords = try moc.fetch(fetchRequest)
      if let state = todoKeywords.first {
        return state
      }
    } catch { }
    return nil
  }
}
