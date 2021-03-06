//
//  Constants.swift
//  Shopin
//
//  Created by cellzone on 9/26/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import Foundation

typealias COMPLETION_HANDLER = (_ success : Bool) -> Void

// let BASE_API = "http://sheltec.com.pk/"
let BASE_API = "http://18.223.244.218/backend/Backend_Shopin/"

let API_GET_CATEGORIES = "\(BASE_API)index.php/api/get_categories"

let API_CATEGORIES_IMAGE = "\(BASE_API)img/categories/"

let API_STORES_IMAGE = "\(BASE_API)img/stores/"

let API_PRODUCTS_IMAGE = "\(BASE_API)img/products/"

let API_GET_STORES = "\(BASE_API)index.php/api/get_stores"

let API_GET_CATEGORY_WISE_PRODUCTS = "\(BASE_API)index.php/api/get_category_wise_producnts"

let API_GET_CATEGORY_GET_SPECIFIC_PRODUCT = "\(BASE_API)index.php/api/product_detail"

let API_ONEPAY_CHECKOUT = "\(BASE_API)index.php/api/checkout_onepay"

let API_ONEPAY_CONFIRM = "\(BASE_API)index.php/api/commit_transaction_onepay"





