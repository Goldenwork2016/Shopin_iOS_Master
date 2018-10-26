//
//  ProductCategoryViewController.swift
//  Shopin
//
//  Created by Golden Work on 8/31/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import UIKit
import SVProgressHUD

class ProductCategoryViewController: MomViewController {

    @IBOutlet weak var lblCategoryName: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var arr_Categories = ["Kids Underwear", "Modern Underwear", "Class Underwear", "Men's Underwear", "Women's Underwear"]
    var selected_category_id : String = ""
    var selected_category_name : String = ""
    var selected_store_id : String = ""
    var selected_store_name : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        self.lblCategoryName.text = selected_category_name
        self.getAllProducts()
        // Do any additional setup after loading the view.
    }
    func getAllProducts(){
        SVProgressHUD.show()
        let param = ["cat_id":selected_category_id,
                     "store_id":selected_store_id,]
        ApiServices.instance.GetStoreProductsWithCategory(param: param) { (success) in
            if success {
                SVProgressHUD.dismiss()
                self.tableView.reloadData()
            }
            else {
                SVProgressHUD.dismiss()
                GlobalData.instance.ProductsList.removeAll()
                self.tableView.reloadData()
                Services.instance.showAlert(message: "There are no products in this store. Coming soon!")
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction override func onChat(_ sender: Any) {
        let chatVC0 = storyboard?.instantiateViewController(withIdentifier: "chatVC") as! ChatViewController
        let chatVC = UINavigationController(rootViewController: chatVC0)
        self.slideMenuController()?.changeMainViewController(chatVC, close: true)
    }
    
    @IBAction override func onNews(_ sender: Any) {
        let newsVC0 = storyboard?.instantiateViewController(withIdentifier: "newsVC") as! NewsViewController
        let newsVC = UINavigationController(rootViewController: newsVC0)
        self.slideMenuController()?.changeMainViewController(newsVC, close: true)
    }
    
    
    @IBAction override func onNotification(_ sender: Any) {
        let notificationVC0 = storyboard?.instantiateViewController(withIdentifier: "notificationVC") as! NotificationViewController
        let notificationVC = UINavigationController(rootViewController: notificationVC0)
        self.slideMenuController()?.changeMainViewController(notificationVC, close: true)
    }
    
    @IBAction override func onSelectCountry(_ sender: Any) {
        let selectCountryVC0 = storyboard?.instantiateViewController(withIdentifier: "selectCountryVC") as! SelectCountryViewController
        let selectCountryVC = UINavigationController(rootViewController: selectCountryVC0)
        self.slideMenuController()?.changeMainViewController(selectCountryVC, close: true)
    }
    
    @IBAction override func onSelectLanguage(_ sender: Any) {
        let selectLanguageVC0 = storyboard?.instantiateViewController(withIdentifier: "selectLanguageVC") as! SelectLanguageViewController
        let selectLanguageVC = UINavigationController(rootViewController: selectLanguageVC0)
        self.slideMenuController()?.changeMainViewController(selectLanguageVC, close: true)
    }
}

extension ProductCategoryViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productListVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "productListVC") as? ProductListViewController
        
        let product = GlobalData.instance.ProductsList[indexPath.row]
        productListVC?.productModel = product
        
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
        return GlobalData.instance.ProductsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier:"productCategoryCell") as! ProductCategoryTableViewCell
        let product = GlobalData.instance.ProductsList[indexPath.row]
        
        cell.configureCell(model: product, brandName: self.selected_store_name)
//        cell.scrollView.contentSize = CGSizeMake(125 * 5, 142)
//        cell.productView = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width - 10, height: 10))
//        cell.scrollView.addSubview(cell.productView)
        
        return cell
    }
}
