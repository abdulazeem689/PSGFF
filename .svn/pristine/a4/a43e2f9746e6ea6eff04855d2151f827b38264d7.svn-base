//
//  TweetHandlerVC.swift
//  PSGFF
//
//  Created by Abdul Azeem on 29/01/20.
//  Copyright © 2020 Mindfire. All rights reserved.
//

import UIKit
import WebKit

class TweetHandlerVC: UIViewController, WKUIDelegate {
    
    //Outlets.
    @IBOutlet var webView: WKWebView!
    //Variables.
    var urlString: String?
    
    //MARK:- View Did Load.
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.uiDelegate = self
        self.loadWebView()
    }
    
    //Load Webview with url request.
    func loadWebView(){
        guard let url = URL(string: urlString!) else{ return }
        let request = URLRequest(url: url)
        self.webView.load(request)
    }
    
    //Go Back Action.
    @IBAction func goBackToTrendingVC(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK:- WKUIDelegate Method.
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        let popUPWebView = WKWebView(frame: self.view.bounds, configuration: configuration)
        popUPWebView.uiDelegate = self
        self.view.addSubview(popUPWebView)
        return popUPWebView
    }
}
