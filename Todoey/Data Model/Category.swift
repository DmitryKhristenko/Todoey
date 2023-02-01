//
//  Category.swift
//  Todoey
//
//  Created by Дмитрий Х on 29.01.23.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var cellBackgroundColor: String = ""
    let items = List<Item>()
}
