//
//  PSGFFWebVC.swift
//  PSGFF
//
//  Created by Abdul Azeem on 01/04/20.
//  Copyright © 2020 Mindfire. All rights reserved.
//

import UIKit
import WebKit

class PSGFFWebVC: BaseVC {

    @IBOutlet var PSGFFWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://psgff.org/")
        let request = URLRequest(url: url!)
        self.PSGFFWebView.load(request)
    }
}
