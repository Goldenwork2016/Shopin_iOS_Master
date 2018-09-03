//
//  LeftViewController.swift
//  Shopin
//
//  Created by Golden Work on 8/29/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import UIKit

enum LeftMenu: Int {
    case profile = 1
    case main
    case myCart
    case myOrder
    case wishlist
    case coupons
    case credits
    case chat
    case aboutUs
    case contactUs
    case termsAndConditions
    case privacyPolicy
}

protocol LeftMenuProtocol : class {
    func changeViewController(_ menu: LeftMenu)
}

class LeftViewController : UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var menus = ["Profile", "Categories", "My cart", "My orders", "Wishlist", "Coupons", "Credits", "Chat", "About us", "Contact us", "Terms and condition", "Privacy policy"]
    var profileVC: UIViewController!
    var mainTabBarVC: UIViewController!
    var myCartVC: UIViewController!
    var myOrdersVC: UIViewController!
    var wishlistVC: UIViewController!
    var couponVC: UIViewController!
    var creditVC: UIViewController!
    var chatVC: UIViewController!
    var aboutUsVC: UIViewController!
    var contactUsVC: UIViewController!
    var termsConditionsVC: UIViewController!
    var privacyPolicyVC: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.profileVC = storyboard.instantiateViewController(withIdentifier: "profileVC") as! ProfileViewController
        self.mainTabBarVC = storyboard.instantiateViewController(withIdentifier: "mainTabBarVC") as! MainTabBarController
        self.myCartVC = storyboard.instantiateViewController(withIdentifier: "myCartVC") as! MycartViewController
        self.myOrdersVC = storyboard.instantiateViewController(withIdentifier: "myOrdersVC") as! MyOrdersViewController
        self.wishlistVC = storyboard.instantiateViewController(withIdentifier: "wishlistVC") as! WishlistViewController
        self.couponVC = storyboard.instantiateViewController(withIdentifier: "couponVC") as! CouponViewController
        self.creditVC = storyboard.instantiateViewController(withIdentifier: "creditVC") as! CreditViewController
        self.chatVC = storyboard.instantiateViewController(withIdentifier: "chatVC") as! ChatViewController
        self.aboutUsVC = storyboard.instantiateViewController(withIdentifier: "aboutUsVC") as! AboutUsViewController
        self.contactUsVC = storyboard.instantiateViewController(withIdentifier: "contactUsVC") as! ContactUsViewController
        self.termsConditionsVC = storyboard.instantiateViewController(withIdentifier: "termsConditionsVC") as! TermsConditionsViewController
        self.privacyPolicyVC = storyboard.instantiateViewController(withIdentifier: "privacyPolicyVC") as! PrivacyPolicyViewController
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func changeViewController(_ menu: LeftMenu) {
        switch menu {
        case .profile:
            self.slideMenuController()?.changeMainViewController(self.profileVC, close: true)
        case .main:
            self.slideMenuController()?.changeMainViewController(self.mainTabBarVC, close: true)
        case .myCart:
            self.slideMenuController()?.changeMainViewController(self.myCartVC, close: true)
        case .myOrder:
            self.slideMenuController()?.changeMainViewController(self.myOrdersVC, close: true)
        case .wishlist:
            self.slideMenuController()?.changeMainViewController(self.wishlistVC, close: true)
        case .coupons:
            self.slideMenuController()?.changeMainViewController(self.couponVC, close: true)
        case .credits:
            self.slideMenuController()?.changeMainViewController(self.creditVC, close: true)
        case .chat:
            self.slideMenuController()?.changeMainViewController(self.chatVC, close: true)
        case .aboutUs:
            self.slideMenuController()?.changeMainViewController(self.aboutUsVC, close: true)
        case .contactUs:
            self.slideMenuController()?.changeMainViewController(self.contactUsVC, close: true)
        case .termsAndConditions:
            self.slideMenuController()?.changeMainViewController(self.termsConditionsVC, close: true)
        case .privacyPolicy:
            self.slideMenuController()?.changeMainViewController(self.privacyPolicyVC, close: true)
        }
    }
}

extension LeftViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 100
        }else{
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let menu = LeftMenu(rawValue: indexPath.row) {
            self.changeViewController(menu)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.tableView == scrollView {
            
        }
    }
}

extension LeftViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = self.tableView.dequeueReusableCell(withIdentifier:"avapterCell") as! AvapterTableViewCell
            return cell
        }else{
            let cell = self.tableView.dequeueReusableCell(withIdentifier:"leftCell") as! LeftTableViewCell
            let title = menus[indexPath.row - 1]
            cell.img_Icon.image = UIImage(named:"icon_" + title)
            cell.lbl_Title.text = title
            return cell
        }
    }   
}
