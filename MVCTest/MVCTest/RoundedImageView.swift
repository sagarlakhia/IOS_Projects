//
//  RoundedImageView.swift
//  MVCTest
//
//  Created by Ishan Lakhia on 10/10/16.
//  Copyright © 2016 Sagar Lakhia. All rights reserved.
//

import UIKit

class RoundedImageView: UIImageView {

   
    override func awakeFromNib() {
        self.layer.cornerRadius=5.0
        self.clipsToBounds=true
        
    }
}
