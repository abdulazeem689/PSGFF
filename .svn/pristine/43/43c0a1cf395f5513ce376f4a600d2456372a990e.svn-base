//
//  BaseVC.swift
//  PSGFF
//
//  Created by Abdul Azeem on 06/02/20.
//  Copyright © 2020 Mindfire. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
        
    //MARK:- Menu Button tapped.
    
    
    @IBAction func toggleMenu(_ sender: Any) {
        self.handleView()
    }
    
    //Handle menu action.
    func handleView(){
        if let navigationC = self.navigationController {
            let shouldExpand = navigationC.view.frame.origin.x == 0
            let leftOffSet = navigationC.view.frame.width * 15 / 100
            UIView.animate(withDuration: 0.4, animations: {
                navigationC.view.frame.origin.x = (shouldExpand) ? navigationC.view.frame.width - leftOffSet : 0
            }, completion: nil)
        }
    }
}
