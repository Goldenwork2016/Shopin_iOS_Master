//
//  ProductDetailsViewController.swift
//  Shopin
//
//  Created by Golden Work on 9/3/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class ProductDetailsViewController: MomViewController {

    var passedProductID = ""
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var producImageView: UIImageView!
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productStoreLabel: UILabel!
    
    @IBOutlet weak var productPricePerUnitLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    @IBOutlet weak var productSizeLabel: UILabel!
    
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productConditionsLabel: UILabel!
    
    @IBOutlet weak var productBrandLabel: UILabel!
    
    var price = 0
    var imageURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        
        self.fetchDetails()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        self.scrollView.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: 855)
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
    
    @IBAction func onBuyNow(_ sender: Any) {
        
//        let checkoutVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "checkoutVC") as? CheckoutViewController
//        self.navigationController?.pushViewController(checkoutVC!, animated: true)
        
        let settingsVC = SettingsViewController()
        
        print(settingsVC.settings)
        
        let checkoutViewController = CheckoutViewController(product: self.productNameLabel.text!,
                                                            price: price * 100,
                                                            settings: settingsVC.settings)
        checkoutViewController.productURL = self.imageURL
            
        self.navigationController?.pushViewController(checkoutViewController, animated: true)


    }
    
    func fetchDetails(){
        
        let param = ["product_id": "\(passedProductID)"]

        ApiServices.instance.GetSpecificProductWithCategory(param: param, success: { (response) in
            print("RESPONSEASDASDASDASDAS \(response)")
            let data = response["data"]
            
            let imageName =  data["pro_image"].string!
            self.imageURL = "\(API_PRODUCTS_IMAGE)\(imageName)"
            let url = URL(string: self.imageURL)
            self.producImageView.kf.setImage(with: url)
            
            self.productSizeLabel.text = data["size"].string!
            self.productPriceLabel.text = "$\(data["price"].string!)"
            self.productDescriptionLabel.text = data["description"].string!
            self.productConditionsLabel.text = data["product_condition"].string!
            self.productNameLabel.text = data["pro_name"].string!
            
            self.price = data["price"].intValue

            
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }
    
    @IBAction func onAddToCard(_ sender: Any) {
        let realm = try! Realm()
        let obj = ProductItem.init()
        obj.product_id = self.passedProductID
        obj.product_name = self.productNameLabel.text!
        obj.quantity = 1
        obj.price = self.price
        obj.image_url = self.imageURL
        try! realm.write {
            realm.add(obj, update: true)
            self.showMessage(message: "Add to Card success", title: "Information")
        }
    }
    
}
