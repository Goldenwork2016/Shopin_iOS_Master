//
//  BackendAPIAdapter.swift
//  Standard Integration (Swift)
//
//  Created by Golden Work on 8/29/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//


import Foundation
import Stripe
import Alamofire

class MyAPIClient: NSObject, STPEphemeralKeyProvider {

    static let sharedClient = MyAPIClient()
    var baseURLString: String? = nil
    var baseURL: URL {
        if let urlString = self.baseURLString, let url = URL(string: urlString) {
            return url
        } else {
            fatalError()
        }
    }

    func completeCharge(_ result: STPPaymentResult,
                        amount: Int,
                        email: String,
                        customer: String,
                        description: String,
                        shippingAddress: STPAddress?,
                        shippingMethod: PKShippingMethod?,
                        completion: @escaping STPErrorBlock) {
        let url = self.baseURL.appendingPathComponent("charge")
        
//        var params: [String: Any] = [
//            "customer": "cus_DqnPIrhdvWsR0a",
//            "amount": amount,
//            "currency" : "USD",
//            "stripeEmail" : "yeshualagac@gmail.com",
//            "stripeToken": "cus_DqnPIrhdvWsR0a"
//            ]

        var params: [String: Any] = [
            "source": result.source.stripeID,
            "amount": amount,
            "customer": customer,
            "currency" : "USD",
            "description" : description
            ]
        
        params["shipping"] = STPAddress.shippingInfoForCharge(with: shippingAddress, shippingMethod: shippingMethod)
        
        print("params \(params)")
        
        Alamofire.request(url, method: .post, parameters: params)
            .validate(statusCode: 200..<300)
            .responseString { response in
                print(response)
                
                switch response.result {
                case .success:
                    completion(nil)
                case .failure(let error):
                    completion(error)
                }
        }
    }

    func createCustomerKey(withAPIVersion apiVersion: String, completion: @escaping STPJSONResponseCompletionBlock) {
        let url = self.baseURL.appendingPathComponent("ephemeral_keys")
        print("URL \(url)")
        
        Alamofire.request(url, method: .post, parameters: ["api_version": apiVersion,"customer_id" : "cus_DqnPIrhdvWsR0a"])
            
            .validate(statusCode: 200..<300)
            .responseJSON { responseJSON in
                switch responseJSON.result {
                case .success(let json):
                    completion(json as? [String: AnyObject], nil)
                case .failure(let error):
                    completion(nil, error)
                }
        }
    }
    

}
