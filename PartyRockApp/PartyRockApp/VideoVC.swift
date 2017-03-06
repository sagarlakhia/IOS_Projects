//
//  VideoVC.swift
//  PartyRockApp
//
//  Created by Ishan Lakhia on 8/28/16.
//  Copyright © 2016 Sagar Lakhia. All rights reserved.
//

import UIKit

class VideoVC: UIViewController {

    
    @IBOutlet weak var webView: UIWebView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    private var _partyRock:PartyRock!
    
    var partyRock:PartyRock{
        get{
            return _partyRock
        }set{
            _partyRock=newValue
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text=partyRock.videoTitle

        webView.allowsInlineMediaPlayback=true

        webView.loadHTMLString( partyRock.videoURL, baseURL: nil)
        // Do any additional setup after loading the view.
    }
 

    @IBAction func backPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
}
