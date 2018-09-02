//
//  SendPWCodeViewController.swift
//  Shopin
//
//  Created by Golden Work on 8/29/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import UIKit

class SendPWCodeViewController: UIViewController {

    @IBOutlet weak var txt_Email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txt_Email.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSendCode(_ sender: Any) {
        let confirmCodeVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "confirmCodeVC") as? ConfirmCodeViewController
        self.navigationController?.pushViewController(confirmCodeVC!, animated: true)
    }
}

extension SendPWCodeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }    
}
