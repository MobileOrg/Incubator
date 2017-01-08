//
//  OrgfileParser.swift
//  Swift-Org-PoC
//
//  Created by Mario Martelli on 04.01.17.
//  Copyright © 2017 Mario Martelli. All rights reserved.
//
//  This program is free software; you can redistribute it and/or
//  modify it under the terms of the GNU General Public License
//  as published by the Free Software Foundation; either version 2
//  of the License, or (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program; if not, write to the Free Software
//  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
//
import Foundation
import CoreData
import SwiftOrg

// Parse the file
struct OrgFileParser {

  let moc: NSManagedObjectContext!

  init(withManagedObjectContect moc: NSManagedObjectContext) {
    self.moc = moc
  }

  func parse(_ file: URL) {
    do {
      let text = try String(contentsOf: file, encoding: String.Encoding.utf8)
      let parser = OrgParser()
      let doc = try! parser.parse(content: text)

      self.parse(document: doc)
      print(text)

    }
    catch {/* error handling here */}
  }


  func parse(document: OrgDocument) {

    // Get default TodoStates
    // let entity = NSEntityDescription.entity(forEntityName: "TodoState", in: moc)
    //    let et = TodoState.cra
    if document.defaultTodos.count == 2,
      let todoStates = document.defaultTodos.first,
      let doneStates = document.defaultTodos.last {

      // FIXME: Could make sense to diverse todo and done states in model
      for state in todoStates {
        let _ = TodoState.create(with: state, in: moc)
      }
      for state in doneStates {
        let _ = TodoState.create(with: state, in: moc)
      }
    }

    // Get document related TodoStates
    // FIXME: these should be stored separately!
    if document.todos.count == 2,
      let todoStates = document.todos.first,
      let doneStates = document.todos.last {

      // FIXME: Could make sense to diverse todo and done states in model
      for state in todoStates {
        let _ = TodoState.create(with: state, in: moc)
      }
      for state in doneStates {
        let _ = TodoState.create(with: state, in: moc)
      }
    }

    // parse all items of document
    for node in document.content as! [Section] {
      parse(section: node, parent: nil)
    }

    //save the whole object context
    do {
      try moc.save()
      print("saved!")
    } catch let error as NSError  {
      print("Could not save \(error), \(error.userInfo)")
    } catch {

    }
  }


  /// Parse Section
  /// Section could be of type Section or Paragraph
  /// - Parameters:
  ///   - section: section to parse
  ///   - parent: parent item of section
  func parse(section: Section, parent: Item?) {
    let entity = NSEntityDescription.entity(forEntityName: "Item", in: moc)
    let item = NSManagedObject(entity: entity!, insertInto: moc) as! Item


    // Set Todo Keyword if any
    if let todoState = section.keyword {
      item.todostate = TodoState.with(title: todoState, in: moc)
    }

    // Link to parent
    item.parent = parent

    // Get attributes
    item.heading = section.title

    // Drawer
    for section in section.content where section is Drawer {
      if let drawer = section as? Drawer {

        // Logbook Entries
        // FIXME: Logbook Entries should be stored as FromDate - ToDate in model for date logs
        if drawer.name == "LOGBOOK" {
          for log in drawer.content {
            let logEntry = LogbookItem.create(with: log, in: moc)
            logEntry.item = item
          }
        }
      }
    }


    // Bodytext is delivered as seperate paragraphs
    for section in section.content where section is Paragraph {
      if let paragraph = section as? Paragraph {
        for line in paragraph.lines {
          item.body?.append(line)
        }
        item.body?.append("\n")
      }
    }

    // Parsing subsection(s)
    for section in section.content where section is Section {
      parse(section: section as! Section, parent: item)
    }
  }
}
