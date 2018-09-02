//
//  ProductCategoryViewController.swift
//  Shopin
//
//  Created by Golden Work on 8/31/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import UIKit

class ProductCategoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var arr_Categories = ["Kids Underwear", "Modern Underwear", "Class Underwear", "Men's Underwear", "Women's Underwear"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ProductCategoryViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productListVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "productListVC") as? ProductListViewController
        self.navigationController?.pushViewController(productListVC!, animated: true)
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if self.tableView == scrollView {
//
//        }
//    }
}

extension ProductCategoryViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_Categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier:"productCategoryCell") as! ProductCategoryTableViewCell
        
        cell.lbl_Category.text = arr_Categories[indexPath.row]
//        cell.scrollView.contentSize = CGSizeMake(125 * 5, 142)
//        cell.productView = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width - 10, height: 10))
//        cell.scrollView.addSubview(cell.productView)
        
        return cell
    }
}
