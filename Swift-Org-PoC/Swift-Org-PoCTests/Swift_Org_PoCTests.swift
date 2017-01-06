//
//  Swift_Org_PoCTests.swift
//  Swift-Org-PoCTests
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
import XCTest
import CoreData

@testable import Swift_Org_PoC

class Swift_Org_PoCTests: XCTestCase {

  var moc:NSManagedObjectContext!

  func testReadFile() {
    let bundle = Bundle(for: type(of: self))

    // now parse the todo list
    if let url = bundle.url(forResource: "TodoList", withExtension: "org") {
      let orgParser = OrgFileParser(withManagedObjectContect: moc)
      orgParser.parse(url)
    } else {
      XCTFail()
    }

    do {
      // Test if there are items stored
      let fetchRequest = NSFetchRequest<Item>(entityName: "Item")
      let items = try moc!.fetch(fetchRequest)
      XCTAssertEqual(items.count, 12)
      //      XCTAssertEqual(items.first?.heading, "Heading 2") // Can fail 🦄
    } catch _ { XCTFail() }
  }

  override func setUp() {
    super.setUp()
    moc = setUpInMemoryManagedObjectContext()
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }

  func setUpInMemoryManagedObjectContext() -> NSManagedObjectContext {
    let managedObjectModel = NSManagedObjectModel.mergedModel(from: [Bundle.main])!

    let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
    try! persistentStoreCoordinator.addPersistentStore(ofType: NSInMemoryStoreType, configurationName: nil, at: nil, options: nil)

    let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator

    return managedObjectContext
  }

}
