//
//  ItemDetails.swift
//  xiaoni
//
//  Created by 赵九洲 on 2018/9/16.
//  Copyright © 2018年 Jzhous. All rights reserved.
//

import Foundation
import RealmSwift

class ItemDetails: Object {
    @objc dynamic var ITEM_ID: Int = 0
    @objc dynamic var ITEM_SPEC: String = ""
    @objc dynamic var PRICE: Double = 0
    @objc dynamic var SPEC_DESC: String = ""
    @objc dynamic var SPEC_IMAGE: String = ""
}
