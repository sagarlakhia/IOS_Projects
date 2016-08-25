//
//  MusicListViewController.swift
//  SegueDemo
//
//  Created by Ishan Lakhia on 8/24/16.
//  Copyright © 2016 Sagar Lakhia. All rights reserved.
//

import UIKit

class MusicListViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        
        view.backgroundColor=UIColor.blue
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

    @IBAction func BackBtn(_ sender: AnyObject) {
    dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loadThirdScreen(_ sender: AnyObject) {
        
        let songTitle="Hello - By Adele"
            
            performSegue(withIdentifier: "SongViewController", sender : songTitle)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PlaySongViewController{
            
            if let song = sender as? String{
            destination.selectedSong=song
            }
            
        }
    }
  }
