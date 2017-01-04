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
  static func parse(_ file: URL, in moc: NSManagedObjectContext) {
    do {
      let text = try String(contentsOf: file, encoding: String.Encoding.utf8)
      let parser = OrgParser()
      let doc = try! parser.parse(content: text)

      print(text)

      let entity =  NSEntityDescription.entity(forEntityName: "Item", in: moc)
      let item = NSManagedObject(entity: entity!, insertInto: moc) as! Item

      for node in doc.content as! [Section] {
        let item = NSManagedObject(entity: entity!, insertInto: moc) as! Item
        item.heading = node.title
      }

      //save the object
      do {
        try moc.save()
        print("saved!")
      } catch let error as NSError  {
        print("Could not save \(error), \(error.userInfo)")
      } catch {

      }


    }
    catch {/* error handling here */}
  }
}
