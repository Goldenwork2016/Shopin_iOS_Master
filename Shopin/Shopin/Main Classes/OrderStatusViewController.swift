//
//  OrderStatusViewController.swift
//  Shopin
//
//  Created by Golden Work on 9/3/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import UIKit

class OrderStatusViewController: UIViewController {

    @IBOutlet weak var productView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        productView.layer.cornerRadius = 10
        productView.layer.borderColor = UIColor.lightGray.cgColor
        productView.layer.borderWidth = 1
        productView.layer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
