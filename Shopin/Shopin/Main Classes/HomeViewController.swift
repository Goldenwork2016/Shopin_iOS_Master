//
//  HomeViewController.swift
//  Shopin
//
//  Created by Golden Work on 8/30/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import UIKit
import SVProgressHUD

class HomeViewController: MomViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var arr_Categories = ["Clothing", "Sportwear", "Shoes", "Jeans", "Underwear", "Sports"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getAllCategories()
        // Do any additional setup after loading the view.
    }
    
    func getAllCategories(){
        SVProgressHUD.show()
        ApiServices.instance.GetAllCategories { (success) in
            if success {
                SVProgressHUD.dismiss()
                self.collectionView.reloadData()
            }
            else {
                SVProgressHUD.dismiss()
                GlobalData.instance.CategoriesList.removeAll()
                self.collectionView.reloadData()
                Services.instance.showAlert(message: "There are no category. Coming soon!")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.addLeftGestures()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction override func onLeftNenu(_ sender: Any) {
        self.slideMenuController()?.openLeft()
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

extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return GlobalData.instance.CategoriesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCollectionViewCell
        
        let category = GlobalData.instance.CategoriesList[indexPath.row]
        cell.ConfigCellForCategory(model: category)
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width/2, height:UIScreen.main.bounds.size.width/2)
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CategoryCollectionViewCell
        let storeVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "storeVC") as? StoreViewController
        
        storeVC?.selected_category_id = cell.id ?? ""
        storeVC?.selected_category_name = cell.lblName.text ?? ""
        
        self.navigationController?.pushViewController(storeVC!, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.contentView.frame = cell.bounds
        cell.setNeedsUpdateConstraints()
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
    }
}
