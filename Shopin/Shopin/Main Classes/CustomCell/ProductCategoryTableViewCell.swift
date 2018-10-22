//
//  ProductCategoryTableViewCell.swift
//  Shopin
//
//  Created by Golden Work on 8/31/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import UIKit

class ProductCategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var lbl_Category: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var productView: UIView!
    @IBOutlet weak var img_Product: UIImageView!
    @IBOutlet weak var lbl_ItemName: UILabel!
    @IBOutlet weak var lbl_ItemPrice: UILabel!
    @IBOutlet weak var lbl_ItemBrand: UILabel!
    
    
    @IBOutlet weak var productView1: UIView!
    @IBOutlet weak var img_Product1: UIImageView!
    @IBOutlet weak var lbl_ItemName1: UILabel!
    @IBOutlet weak var lbl_ItemPrice1: UILabel!
    @IBOutlet weak var lbl_ItemBrand1: UILabel!
    
    @IBOutlet weak var productView2: UIView!
    @IBOutlet weak var img_Product2: UIImageView!
    @IBOutlet weak var lbl_ItemName2: UILabel!
    @IBOutlet weak var lbl_ItemPrice2: UILabel!
    @IBOutlet weak var lbl_ItemBrand2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        categoryView.layer.cornerRadius = 10
        categoryView.layer.masksToBounds = true
        categoryView.layer.borderWidth = 1
        categoryView.layer.borderColor = UIColor.lightGray.cgColor
        
//        categoryView.layer.masksToBounds = false
//        categoryView.layer.shadowColor = UIColor.black.cgColor
//        categoryView.layer.shadowOpacity = 0.5
//        categoryView.layer.shadowOffset = CGSize(width: -1, height: 1)
//        categoryView.layer.shadowRadius = 1
//
//        categoryView.layer.shadowPath = UIBezierPath(rect: bounds).cgPath
//        categoryView.layer.shouldRasterize = true
//        categoryView.layer.rasterizationScale = true ? UIScreen.main.scale : 1
        
//        productView.layer.borderColor = UIColor.gray.cgColor
//        productView.layer.borderWidth = 1
    }

    func configureCell(model : ProductsModel,brandName : String){
        let catgory = model.category
        self.lbl_Category.text = catgory.value(forKey: "cat_name") as? String ?? ""
        let products = model.Products
        
        for i in 0..<products.count {
            let product = products[i] as? NSDictionary
            if i == 0 {
                self.lbl_ItemName.text = product?.value(forKey: "pro_name") as? String ?? ""
                self.lbl_ItemBrand.text = "Brand :\(brandName)"
                let price = product?.value(forKey: "price") as? String ?? ""
                self.lbl_ItemPrice.text = "$\(price)"
                let imageName =  product?.value(forKey: "pro_image") as? String ?? ""
                let imageUrl = "\(API_PRODUCTS_IMAGE)\(imageName)"
                let url = URL(string: imageUrl)
                self.img_Product.kf.setImage(with: url)
            }
            else if i == 1 {
                self.lbl_ItemName1.text = product?.value(forKey: "pro_name") as? String ?? ""
                self.lbl_ItemBrand1.text = "Brand :\(brandName)"
                let price = product?.value(forKey: "price") as? String ?? ""
                self.lbl_ItemPrice1.text = "$\(price)"
                let imageName =  product?.value(forKey: "pro_image") as? String ?? ""
                let imageUrl = "\(API_PRODUCTS_IMAGE)\(imageName)"
                let url = URL(string: imageUrl)
                self.img_Product1.kf.setImage(with: url)
            }
            else if i == 2 {
                self.lbl_ItemName2.text = product?.value(forKey: "pro_name") as? String ?? ""
                self.lbl_ItemBrand2.text = "Brand :\(brandName)"
                let price = product?.value(forKey: "price") as? String ?? ""
                self.lbl_ItemPrice2.text = "$\(price)"
                let imageName =  product?.value(forKey: "pro_image") as? String ?? ""
                let imageUrl = "\(API_PRODUCTS_IMAGE)\(imageName)"
                let url = URL(string: imageUrl)
                self.img_Product2.kf.setImage(with: url)
            }
            
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
