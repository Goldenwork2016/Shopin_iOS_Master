//
//  MyOrdersViewController.swift
//  Shopin
//
//  Created by Golden Work on 9/1/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import UIKit

class MyOrdersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
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

extension MyOrdersViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.tableView == scrollView {
            
        }
    }
}

extension MyOrdersViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier:"wishListCell") as! WishListTableViewCell
        cell.lbl_ItemNO.text = (String)(indexPath.row + 1)
        return cell
    }
}

