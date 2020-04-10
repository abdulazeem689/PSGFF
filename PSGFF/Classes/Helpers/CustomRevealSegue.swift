//
//  CustomRevealSegue.swift
//  PSGFF
//
//  Created by Abdul Azeem on 11/02/20.
//  Copyright © 2020 Mindfire. All rights reserved.
//

import UIKit

class CustomRevealSegue: UIStoryboardSegue {

    override func perform() {
        let parentViewC = self.source
        let destinationViewC = self.destination
        
        if let lastViewC = parentViewC.children.last {
            lastViewC.view.removeFromSuperview()
            lastViewC.removeFromParent()
        }
        let leftOffSet = destinationViewC.view.frame.width * 15 / 100
        destinationViewC.view.frame.origin.x = destinationViewC.view.frame.width - leftOffSet

        parentViewC.addChild(destinationViewC)
        parentViewC.view.addSubview(destinationViewC.view)
        UIView.animate(withDuration: 0.4, animations: {
            destinationViewC.view.frame.origin.x = 0
        }, completion: nil)
    }
}
