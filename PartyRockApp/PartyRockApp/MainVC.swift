//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Ishan Lakhia on 8/28/16.
//  Copyright © 2016 Sagar Lakhia. All rights reserved.
//

import UIKit

class MainVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView:UITableView!
    
    var partyRocks = [PartyRock]()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
       
        let imageTest="http://mediaserver-cont-ch1-1-v4v6.pandora.com/images/public/amz/0/8/8/7/800077880_130W_130H.jpg"
        let imageTest2="http://img2-ak.lst.fm/i/u/174s/222f2377004441ad94fa00d184787758.png"
        let imageTest3="https://i0.thrillcall.com/artist/428253/26722/1403228853/redfoo-large.jpg"
        let imageTest4="https://i.ytimg.com/vi/J7MQDULNIdU/hqdefault.jpg"
        let imageTest5="http://static.djbooth.net/pics-tracks/redfoo-letsget.jpg"
        
        
        let videoUrl5="<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/CdLhdrNgGu4\" frameborder=\"0\" allowfullscreen></iframe>"
        
        let videoUrl4="<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/tWyuglGCKgE\" frameborder=\"0\" allowfullscreen></iframe>"
        
        let videoUrl1="<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/TrVLu9p65a0\" frameborder=\"0\" allowfullscreen></iframe>"
        
        let videoUrl2="<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/cEn5KKrzS2E\" frameborder=\"0\" allowfullscreen></iframe>"
        
        let videoUrl3="<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/KQ6zr6kCPj8\" frameborder=\"0\" allowfullscreen></iframe>"
       
        let p1 = PartyRock(imageURL: imageTest, videoURL: videoUrl1, videoTitle: "Where the Sun goes")
        
        let p2 = PartyRock(imageURL: imageTest2, videoURL: videoUrl2, videoTitle: "Party Train")
        
        let p3 = PartyRock(imageURL: imageTest3, videoURL: videoUrl3, videoTitle: "Party Rock")
        
        let p4 = PartyRock(imageURL: imageTest4, videoURL: videoUrl4, videoTitle: "Juicy Wiggle")
        
        let p5 = PartyRock(imageURL: imageTest5, videoURL: videoUrl5, videoTitle: "Lets Get Ridiculous")
        
        
        
        
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        
        tableView.delegate=self
        tableView.dataSource=self
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell",for:indexPath) as? PartyCell{
            
            let partyRock = partyRocks[indexPath.row]
            
            cell.updateUI(partyRock: partyRock)
            
            return cell
        }
        else{
            return UITableViewCell()
        }
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let partyRock = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC{
            
            if let party = sender as? PartyRock{
                destination.partyRock=party
            }
        }
    }
}

