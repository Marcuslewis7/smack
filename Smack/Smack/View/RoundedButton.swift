//
//  RoundedButton.swift
//  Smack
//
//  Created by Marcus Lewis on 24/01/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import UIKit
@IBDesignable


class RoundedButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 5.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func awakeFromNib() {
        self.setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = cornerRadius
    }
    
    
}
