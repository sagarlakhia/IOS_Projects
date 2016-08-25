//
//  ViewController.swift
//  ScrollView
//
//  Created by Ishan Lakhia on 8/24/16.
//  Copyright © 2016 Sagar Lakhia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var images = [UIImageView]()
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //var contentWidth:CGFloat=0.0
        let scrollViewWidth = scrollView.frame.size.width
        
        for x in 0...2{
            
            let image = UIImage(named:"icon\(x).png")
            let imageView = UIImageView(image:image)
            images.append(imageView)

            var newX:CGFloat = 0.0

            newX=scrollViewWidth/2 + scrollViewWidth * CGFloat(x)
            
            //contentWidth+=newX

            scrollView.addSubview(imageView)
            
            imageView.frame = CGRect(x: newX - 75, y : (scrollView.frame.size.height/2)-75, width:150, height : 150)
        }
        
        scrollView.clipsToBounds=false
        scrollView.contentSize=CGSize(width: scrollViewWidth *  CGFloat(images.count), height: view.frame.size.height)
        
    }

}

