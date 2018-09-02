//
//  ProfileViewController.swift
//  Shopin
//
//  Created by Golden Work on 9/1/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var img_Profile: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.img_Profile.layer.cornerRadius = self.img_Profile.bounds.width/2
        self.img_Profile.layer.borderWidth = 3
        self.img_Profile.layer.borderColor = UIColor(red: 247.0/255, green: 201.0/255, blue: 21.0/255, alpha: 1.0).cgColor
        self.img_Profile.layer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLeftNenu(_ sender: Any) {
        self.slideMenuController()?.openLeft()
    }
    
}
