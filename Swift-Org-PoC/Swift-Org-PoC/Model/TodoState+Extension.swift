//
//  TodoState+Extension.swift
//  Swift-Org-PoC
//
//  Created by Mario Martelli on 08.01.17.
//  Copyright © 2017 Schnuddel Huddel. All rights reserved.
//

import Foundation
import CoreData

extension TodoState {
  class func create(with title: String, in moc: NSManagedObjectContext) -> TodoState {

    if let existingState = TodoState.with(title: title, in: moc) {
      return existingState
    }

    let todoState = NSEntityDescription.insertNewObject(forEntityName: NSStringFromClass(TodoState.self), into: moc) as! TodoState
    todoState.title = title

    return todoState
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
