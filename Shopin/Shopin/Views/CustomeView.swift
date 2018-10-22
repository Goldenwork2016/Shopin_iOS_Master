//
//  CustomeView.swift
//  FlightDentalSystems
//
//  Created by cellzone on 8/3/18.
//  Copyright © 2018 Appcrates. All rights reserved.
//

//import Foundation
import UIKit

@IBDesignable
class CustomView: UIView{
    
    @IBInspectable var borderWidth: CGFloat = 0.0{
        
        didSet{
            
            self.layer.borderWidth = borderWidth
           

        }
    }
    
    @IBInspectable var CornerRadius: CGFloat = 5.0 {
        
        didSet {
            
            self.layer.cornerRadius = CornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        
        didSet {
            
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    override func prepareForInterfaceBuilder() {
        
        super.prepareForInterfaceBuilder()
    }
    
}
