//
//  PrivacyPolicyViewController.swift
//  Shopin
//
//  Created by Golden Work on 9/1/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import UIKit

class PrivacyPolicyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLeftNenu(_ sender: Any) {
        self.slideMenuController()?.openLeft()
    }

}
