//
//  MenuInfo.swift
//  xiaoni
//
//  Created by 赵九洲 on 2018/9/15.
//  Copyright © 2018年 Jzhous. All rights reserved.
//

import Foundation
import RealmSwift

class MenuInfo: Object {
    @objc dynamic var MENU_ID: Int = 0
    @objc dynamic var MENU_NAME: String = ""
    @objc dynamic var PARENT_ID: Int = 0
    @objc dynamic var SORT: Int = 0
    @objc dynamic var ITEM_FLAG: Int = 0
    
    override static func primaryKey() -> String? {
        return "MENU_ID"
    }
}
