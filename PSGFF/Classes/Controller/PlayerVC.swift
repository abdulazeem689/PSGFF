//
//  PlayerVC.swift
//  PSGFF
//
//  Created by Abdul Azeem on 31/01/20.
//  Copyright © 2020 Mindfire. All rights reserved.
//

import UIKit
import AVKit

class PlayerVC: AVPlayerViewController {
    
    //Variables.
    var urlString: String?
    
    //MARK:- View Did Load.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadVideo()
    }
    
    //Load video on the AVPlayer.
    private func loadVideo(){
        guard let url = URL(string: self.urlString!) else {
            return
        }
        let player = AVPlayer(url: url)
        self.player = player
    }
}
