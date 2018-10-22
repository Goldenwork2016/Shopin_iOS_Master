//
//  ApiServices.swift
//  Shopin
//
//  Created by cellzone on 9/26/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ApiServices {
    
    static let instance = ApiServices()
    
    func GetAllCategories(completion : @escaping COMPLETION_HANDLER){
        
        Alamofire.request(API_GET_CATEGORIES, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            if response.result.error == nil {
                do {
                    let data = try JSON(data: response.data!)
                    print(data)
                    let status = data["code"].int
                    if status != nil {
                        if status == 200 {
                            let apiData = data["data"].arrayObject as NSArray?
                            
                            if apiData != nil {
                                let count = (apiData?.count)!
                                for i in 0..<count {
                                    
                                    let category = apiData?[i] as? NSDictionary
                                  
                                    let name = category?.value(forKey: "cat_name") as? String ?? ""
                                    let id = category?.value(forKey: "id") as? String ?? ""
                                    let image = category?.value(forKey: "image") as? String ?? ""
                                    let parent_id = category?.value(forKey: "parent_id") as? String ?? ""
                                    let post_date = category?.value(forKey: "post_date") as? String ?? ""
                                    
                                    let model = CategoriesModel(cat_name: name, id: id, image: image, parent_id: parent_id, post_date: post_date)

                                    GlobalData.instance.CategoriesList.append(model)

                                }
                            }
                            
                            completion(true)
                        }
                        else {
                            let message = data["message"].string
                            if message != nil {
                                Services.instance.showAlert(message : message!)
                            }
                            completion(false)
                        }
                    }
                    else {
                        completion(false)
                    }
                }
                catch {
                    completion(false)
                }
            }
            else {
                let message = response.result.error
                if message != nil {
                    Services.instance.showAlert(message : message.debugDescription)
                }
                completion(false)
            }
        }
    }
    
    func GetStores(cat_id : Int,completion : @escaping COMPLETION_HANDLER){
        
        let param = ["cat_id":cat_id]
        print(param)
        
        Alamofire.request(API_GET_STORES, method: .post, parameters: param).responseJSON {
            response in
            print(response)
            
            switch response.result {
            case .success(_):
                do {
                    let data = try JSON(data: response.data!)
                    print(data)
                    let status = data["code"].int
                    if status != nil {
                        if status == 200 {
                            let apiData = data["data"].arrayObject as NSArray?
                            
                            if apiData != nil {
                                let count = (apiData?.count)!
                                for i in 0..<count {
                                    
                                    let store = apiData?[i] as? NSDictionary
                                    let name = store?.value(forKey: "store_name") as? String ?? ""
                                    let id = store?.value(forKey: "id") as? String ?? ""
                                    let image = store?.value(forKey: "store_img") as? String ?? ""
                                    print(image)
                                    
                                    let model = StoresModel(store_name: name, id: id, image: image)
                                    
                                    GlobalData.instance.StoresList.append(model)
                                    
                                }
                            }
                            
                            completion(true)
                        }
                        else {
                            let message = data["msg"].string
                            if message != nil {
                                Services.instance.showAlert(message : message!)
                            }
                            completion(false)
                        }
                    }
                    else {
                        completion(false)
                    }
                }
                catch {
                    completion(false)
                }
            case .failure(_):
                completion(false)
                
            }
        }
        
    }
    
    
    func GetStoreProductsWithCategory(param : [String:String],completion : @escaping COMPLETION_HANDLER){
        
        print(param)
        Alamofire.request(API_GET_CATEGORY_WISE_PRODUCTS, method: .post, parameters: param).responseJSON {
            response in
            
            switch response.result {
            case .success(_):
                do {
                    let data = try JSON(data: response.data!)
                    print(data)
                    let status = data["code"].int
                    if status != nil {
                        if status == 200 {
                            let apiData = data["data"].arrayObject as NSArray?
                            
                            if apiData != nil {
                                let count = (apiData?.count)!
                                for i in 0..<count {
                                    
                                    let store = apiData?[i] as? NSDictionary
                                    let category = store?.value(forKey: "category") as? NSDictionary ?? NSDictionary()
                                   
                                    let products = store?.value(forKey: "products") as? NSArray ?? NSArray()
                                    
                                    let model = ProductsModel(category: category, Products: products)

                                    GlobalData.instance.ProductsList.append(model)
                                    
                                }
                            }
                            
                            completion(true)
                        }
                        else {
                            let message = data["msg"].string
                            if message != nil {
                                Services.instance.showAlert(message : message!)
                            }
                            completion(false)
                        }
                    }
                    else {
                        completion(false)
                    }
                }
                catch {
                    completion(false)
                }
            case .failure(_):
                completion(false)
                
            }
        }
    }
    
}
