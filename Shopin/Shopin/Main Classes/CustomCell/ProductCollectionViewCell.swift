//
//  ProductCollectionViewCell.swift
//  Shopin
//
//  Created by Golden Work on 9/1/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productView: UIView!

    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productSizeLabel: UILabel!
    @IBOutlet weak var productUnitLabel: UILabel!
    
    @IBOutlet weak var productImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.productView.layer.cornerRadius = 10
        self.productView.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        self.productView.layer.cornerRadius = 10
        self.productView.layer.masksToBounds = true
    }
}
