//
//  LoginViewController.swift
//  Shopin
//
//  Created by Golden Work on 8/29/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var txt_Email: UITextField!
    @IBOutlet weak var txt_Password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txt_Email.delegate = self
        txt_Password.delegate = self
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveDownScreen)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func moveUpScreen() {
        UIView.animate(withDuration: 0.3) {
            self.view.frame = CGRect(x: 0, y: -UIScreen.main.bounds.height * 0.2, width: self.view.frame.width, height: self.view.frame.height)
        }
    }
    
    @objc func moveDownScreen() {
        view.endEditing(true)
        UIView.animate(withDuration: 0.3) {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        }
    }
    
    @IBAction func onLoginWithEmail(_ sender: Any) {
        let mainTabBarVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "mainTabBarVC") as? MainTabBarController
        self.navigationController?.pushViewController(mainTabBarVC!, animated: true)
    }
    
    @IBAction func onLoginWithFB(_ sender: Any) {
        let mainTabBarVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "mainTabBarVC") as? MainTabBarController
        self.navigationController?.pushViewController(mainTabBarVC!, animated: true)
    }
    
    @IBAction func onLoginWithBiometric(_ sender: Any) {
        let loginWithBiometricVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "loginWithBiometricVC") as? LoginWithBiometricViewController
        self.navigationController?.pushViewController(loginWithBiometricVC!, animated: true)
    }
    
    @IBAction func onForgotPW(_ sender: Any) {
        let sendPWCodeVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "sendPWCodeVC") as? SendPWCodeViewController
        self.navigationController?.pushViewController(sendPWCodeVC!, animated: true)
    }

    @IBAction func onSignup(_ sender: Any) {
        let signupVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "signupVC") as? SignupViewController
        self.navigationController?.pushViewController(signupVC!, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        moveUpScreen()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txt_Email {
            txt_Password.becomeFirstResponder()
        }
        else if textField == txt_Password {
            textField.resignFirstResponder()
            moveDownScreen()
        }
        return true
    }    
}
