//
//  PlaySongViewController.swift
//  SegueDemo
//
//  Created by Ishan Lakhia on 8/24/16.
//  Copyright © 2016 Sagar Lakhia. All rights reserved.
//

import UIKit

class PlaySongViewController: UIViewController {

    @IBOutlet weak var songTitleLabel: UILabel!
    
    private var _selectedSong:String!
    
    var selectedSong:String{
        get{
            return _selectedSong
        } set{
            _selectedSong = newValue
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        songTitleLabel.text=selectedSong
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
