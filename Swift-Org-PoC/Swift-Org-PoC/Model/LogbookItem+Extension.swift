//
//  LogbookItem+Extension.swift
//  Swift-Org-PoC
//
//  Created by Mario Martelli on 08.01.17.
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

extension LogbookItem {
  class func create(from: Date?, to: Date?,  in moc: NSManagedObjectContext) -> LogbookItem {

    let logbookItem = NSEntityDescription.insertNewObject(forEntityName: NSStringFromClass(LogbookItem.self), into: moc) as! LogbookItem

    logbookItem.from = from as NSDate?
    logbookItem.to = to as NSDate?
    
    return logbookItem
  }
}
