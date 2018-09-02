//
//  SignupViewController.swift
//  Shopin
//
//  Created by Golden Work on 8/29/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var txt_FullName: UITextField!
    @IBOutlet weak var txt_Email: UITextField!
    @IBOutlet weak var txt_PhoneNO: UITextField!
    @IBOutlet weak var txt_Password: UITextField!
    @IBOutlet weak var txt_ConfirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txt_FullName.delegate = self
        txt_Email.delegate = self
        txt_PhoneNO.delegate = self
        txt_Password.delegate = self
        txt_ConfirmPassword.delegate = self
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveDownScreen)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    
    @IBAction func onLogin(_ sender: Any) {
        let loginVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "loginVC") as? LoginViewController
        self.navigationController?.pushViewController(loginVC!, animated: true)
    }
    
    
    @IBAction func onLoginWithBiometric(_ sender: Any) {
        let loginWithBiometricVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "loginWithBiometricVC") as? LoginWithBiometricViewController
        self.navigationController?.pushViewController(loginWithBiometricVC!, animated: true)
    }
}

extension SignupViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        moveUpScreen()
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txt_FullName {
            txt_Email.becomeFirstResponder()
        }else if textField == txt_Email{
            txt_PhoneNO.becomeFirstResponder()
        }else if textField == txt_PhoneNO{
            txt_Password.becomeFirstResponder()
        }else if textField == txt_Password{
            txt_ConfirmPassword.becomeFirstResponder()
        }else if textField == txt_ConfirmPassword{
            textField.resignFirstResponder()
            moveDownScreen()
        }

        return true
    }
}

