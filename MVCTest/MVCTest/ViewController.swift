//
//  ViewController.swift
//  MVCTest
//
//  Created by Ishan Lakhia on 10/10/16.
//  Copyright © 2016 Sagar Lakhia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fullName: UILabel!
    
    @IBOutlet weak var renameName: UITextField!
    
    let person = Person(first:"John", last:"Hancock")
    
    @IBAction func btnPressed(_ sender: AnyObject) {
        
        if let txt = renameName.text{
            
            person.firstName=txt
            fullName.text=person.fullName
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        
        fullName.text = person.fullName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

