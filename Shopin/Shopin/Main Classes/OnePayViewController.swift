//
//  OnePayViewController.swift
//  Shopin
//
//  Created by NGUYEN NGOC THANH on 11/10/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import UIKit
import OnePaySDK
import os.log

class OnePayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func checkOut() {
        let onepay = OnePay();
        onepay.initPayment("aqui-va-la-occ",
                           callback: {(statusCode, description) in
                            switch statusCode {
                            case OnePayState.occInvalid:
                                // Algo anda mal con el occ que obtuviste desde el backend
                                // Debes reintentar obtener el occ o abortar
                                
                                print("Onepay invalid")
                            case OnePayState.notInstalled:
                                // Onepay no está instalado.
                                // Debes abortar o pedir al usuario instalar Onepay (y luego reintentar initPayment)
                                print("Onepay no instalado")
                            }
        }
        )
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
