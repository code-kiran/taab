//
//  NewsLandingVC.swift
//  taab
//
//  Created by kiran on 9/4/18.
//  Copyright © 2018 kiran. All rights reserved.
//

import UIKit
import WebKit

class NewsLandingVC: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    var url1: String?
    override func viewDidLoad() {
        
        print(url1!)
        super.viewDidLoad()
        linkLabel.text = url1
//
//        webView = WKWebView()
//        webView.navigationDelegate = self
//        view = webView
//
//        let url = URL(string: url1!)
//        webView.load(URLRequest(url: url!))
//        webView.allowsBackForwardNavigationGestures = true

    }
    
    

    override func viewDidAppear(_ animated: Bool) {

        super.viewDidAppear(true)
        webView.navigationDelegate = self

        let url = URL(string: "https:www.google.com")
        webView.load(URLRequest(url: url!))
        webView.allowsBackForwardNavigationGestures = true

            }

    

    @IBAction func btnClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
