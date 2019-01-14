//
//  WKWebViewController.swift
//  MyTechNews
//
//  Created by Naoki Muroya on 2019/01/13.
//  Copyright © 2019 Naoki. All rights reserved.
//

import UIKit
import WebKit

class WKWebViewController: UIViewController, WKUIDelegate {

    var webView : WKWebView!
    
    var targetUrl = ""
    
    override func loadView() {
        
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myRequest = URLRequest(url: URL(string: targetUrl)!)
        webView.load(myRequest)
        
    }
    

}
