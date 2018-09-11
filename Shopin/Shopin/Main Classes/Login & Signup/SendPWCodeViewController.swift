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
        guard let textEmail = txt_Email.text, !textEmail.isEmpty else {
            self.alertMessage(message: "Please enter email.", title: "")
            return
        }
        
        self.alertMessage(message: "OTP sent on email, please check your email.", title: "")
        let confirmCodeVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "confirmCodeVC") as? ConfirmCodeViewController
        self.navigationController?.pushViewController(confirmCodeVC!, animated: true)
    }
    func alertMessage(message: String, title:String) {
        
        let alert = UIAlertController(title: "Warning!", message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func didSelectBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension SendPWCodeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }    
}
