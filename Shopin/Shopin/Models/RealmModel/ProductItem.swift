//
//  ProductItem.swift
//  Shopin
//
//  Created by NGUYEN NGOC THANH on 11/20/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift
import ObjectMapper_Realm
import BoltsSwift

class ProductItem: Object, Mappable {
    @objc dynamic var product_id = ""
    @objc dynamic var product_name = ""
    @objc dynamic var image_url = ""
    @objc dynamic var quantity = -1
    @objc dynamic var price = -1
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override class func primaryKey() -> String? {
        return "product_id"
    }
    
    
    func mapping(map: Map) {
        product_id            <- map["product_id"]
        product_name         <- map["product_name"]
        image_url         <- map["image_url"]
        quantity         <- map["quantity"]
        price         <- map["price"]
    }
}
