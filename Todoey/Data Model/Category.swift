//
//  Category.swift
//  Todoey
//
//  Created by Дмитрий Х on 21.10.22.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
