//
//  ChangePWViewController.swift
//  Shopin
//
//  Created by Golden Work on 8/29/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import UIKit

class ChangePWViewController: UIViewController {

    @IBOutlet weak var txt_Password: UITextField!
    @IBOutlet weak var txt_ConfirmPW: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txt_Password.delegate = self
        txt_ConfirmPW.delegate = self
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveDownScreen)))
    }
    
    func moveUpScreen() {
        UIView.animate(withDuration: 0.3) {
            self.view.frame = CGRect(x: 0, y: -UIScreen.main.bounds.height * 0.1, width: self.view.frame.width, height: self.view.frame.height)
        }
    }
    
    @objc func moveDownScreen() {
        view.endEditing(true)
        UIView.animate(withDuration: 0.3) {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ChangePWViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        moveUpScreen()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txt_Password {
            txt_ConfirmPW.becomeFirstResponder()
        }
        else if textField == txt_ConfirmPW {
            textField.resignFirstResponder()
            moveDownScreen()
        }
        return true
    }
}
