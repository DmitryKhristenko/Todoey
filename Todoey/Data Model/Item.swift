//
//  Item.swift
//  Todoey
//
//  Created by Дмитрий Х on 21.10.22.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date? = Date()
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
