//
//  PartyCell.swift
//  PartyRockApp
//
//  Created by Ishan Lakhia on 8/28/16.
//  Copyright © 2016 Sagar Lakhia. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet weak var videoPreviewImage: UIImageView!
    
    
    @IBOutlet weak var videoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        
    
    }
    func updateUI(partyRock: PartyRock){
        
        videoTitle.text=partyRock.videoTitle
        
        
        //TODO: Set image from URL
        
        //Geting data from async task
        
        let url = URL(string: partyRock.imageURL)!
        
        DispatchQueue.global().async {
            
            do{
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image=UIImage(data: data)
                }
            
            } catch {
                //Handle if error
            }
        }
        
        
    }
}
