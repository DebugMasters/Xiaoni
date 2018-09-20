//
//  ItemInfo.swift
//  xiaoni
//
//  Created by 赵九洲 on 2018/9/16.
//  Copyright © 2018年 Jzhous. All rights reserved.
//

import Foundation
import RealmSwift

class ItemInfo: Object {
    @objc dynamic var ITEM_ID: Int = 0
    @objc dynamic var ITEM_NAME: String = ""
    @objc dynamic var MENU_ID: Int = 0
    @objc dynamic var DESC: String = ""
    @objc dynamic var IMAGE: String = ""
    @objc dynamic var SORT: Int = 0
    @objc dynamic var AVAILABLE: Int = 1
    
    override static func primaryKey() -> String? {
        return "ITEM_ID"
    }
}
