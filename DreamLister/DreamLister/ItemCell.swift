//
//  ItemCell.swift
//  DreamLister
//
//  Created by Ishan Lakhia on 3/4/17.
//  Copyright © 2017 Sagar Lakhia. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var details: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    
    func configureCell(item:Item)
    {
        title.text = item.title
        price.text = "$\(item.price)"
        details.text = item.details
    }
}
