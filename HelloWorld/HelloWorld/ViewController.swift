//
//  ViewController.swift
//  HelloWorld
//
//  Created by Ishan Lakhia on 8/23/16.
//  Copyright © 2016 Sagar Lakhia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleImage: UIImageView!
    
    
    @IBOutlet weak var background: UIImageView!
    
    
    
    @IBOutlet weak var welcomeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func welcomePressed(_ sender: AnyObject) {
        
        welcomeButton.isHidden=true
        titleImage.isHidden=false
        background.isHidden=false
    }
    
}

