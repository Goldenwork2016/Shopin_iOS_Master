
//
//  ConfirmCodeViewController.swift
//  Shopin
//
//  Created by Golden Work on 8/29/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import UIKit

class ConfirmCodeViewController: UIViewController {

    @IBOutlet weak var txt_Code: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txt_Code.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onConfirmCode(_ sender: Any) {
        let changePWVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "changePWVC") as? ChangePWViewController
        self.navigationController?.pushViewController(changePWVC!, animated: true)
    }
}

extension ConfirmCodeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
