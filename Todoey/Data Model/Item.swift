//
//  Item.swift
//  Todoey
//
//  Created by Дмитрий Х on 29.01.23.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date? = Date()
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
