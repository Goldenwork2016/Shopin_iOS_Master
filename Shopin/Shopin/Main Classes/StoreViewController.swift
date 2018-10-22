//
//  StoreViewController.swift
//  Shopin
//
//  Created by Golden Work on 8/31/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import UIKit
import SVProgressHUD

class StoreViewController: MomViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var arr_Stores = ["Adidas", "Nike", "Puma", "Reebok", "Lancer", "Sparx"]
    var selected_category_id : String = ""
    var selected_category_name : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.getAllStores()
        // Do any additional setup after loading the view.
    }
    
    func getAllStores(){
        SVProgressHUD.show()
        let id = Int(selected_category_id)
        ApiServices.instance.GetStores(cat_id: id ?? 0) { (success) in
            if success {
                SVProgressHUD.dismiss()
                self.collectionView.reloadData()
            }
            else {
                SVProgressHUD.dismiss()
                Services.instance.showAlert(message: "There are no stores in this category. Coming soon!")
                GlobalData.instance.StoresList.removeAll()
                self.collectionView.reloadData()
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.addLeftGestures()
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

extension StoreViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return GlobalData.instance.StoresList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCollectionViewCell
        
        let category = GlobalData.instance.StoresList[indexPath.row]
        cell.ConfigCellForStore(model: category)
        return cell
    }
}
    
extension StoreViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: UIScreen.main.bounds.size.width/2, height:UIScreen.main.bounds.size.width/2)
    }
}

extension StoreViewController: UICollectionViewDelegate {
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let productCategoryVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "productCategoryVC") as? ProductCategoryViewController
            let cell = collectionView.cellForItem(at: indexPath) as! CategoryCollectionViewCell
            productCategoryVC?.selected_category_id = self.selected_category_id
            productCategoryVC?.selected_category_name = self.selected_category_name
            productCategoryVC?.selected_store_id = cell.id!
            productCategoryVC?.selected_store_name = cell.name!
            self.navigationController?.pushViewController(productCategoryVC!, animated: true)
        }
        
        func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
            cell.contentView.frame = cell.bounds
            cell.setNeedsUpdateConstraints()
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
        }
}
