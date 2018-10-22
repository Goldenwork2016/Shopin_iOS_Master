//
//  Services.swift
//  Shopin
//
//  Created by cellzone on 9/26/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import Foundation

import Foundation
import UIKit

class Services {
    
    static let instance = Services()
    
    func showAlert(message : String){
        let alert = UIAlertController( title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}
