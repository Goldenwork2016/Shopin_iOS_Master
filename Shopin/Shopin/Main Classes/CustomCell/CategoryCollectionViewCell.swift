//
//  CategoryCollectionViewCell.swift
//  Shopin
//
//  Created by Golden Work on 8/31/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var img_Category: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    var id : String?
    var name : String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.img_Category.layer.cornerRadius = self.img_Category.bounds.width/2
        self.img_Category.layer.masksToBounds = true        
    }
    
    override func layoutSubviews() {
        self.img_Category.layer.cornerRadius = self.img_Category.bounds.width/2
        self.img_Category.layer.masksToBounds = true
    }
    
    func ConfigCellForCategory(model : CategoriesModel)  {
        
        self.id = model.id
        self.lblName.text = model.cat_name
        let image = model.image
        let imageUrl = "\(API_CATEGORIES_IMAGE)\(image)"
        let url = URL(string: imageUrl)
        self.img_Category.kf.setImage(with: url)
        
    }
    func ConfigCellForStore(model : StoresModel)  {
        self.id = model.id
        self.name = model.store_name
        self.lblName.text = model.store_name
        let image = model.image
        let imageUrl = "\(API_STORES_IMAGE)\(image)"
        print(imageUrl)
        let url = URL(string: imageUrl)
        self.img_Category.kf.setImage(with: url)
        
    }
}
