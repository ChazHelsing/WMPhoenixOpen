//
//  DonateViewController.swift
//  Test
//
//  Created by Chaz Helsing on 1/21/17.
//  Copyright © 2017 Helsing Productions. All rights reserved.
//

import Foundation
import UIKit

class DonateViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadAddress()
    }
    
    func loadAddress() {
        let requestUrl = NSURL(string: "https://events.trustevent.com/templates/index.cfm?fuseaction=templates.register&eid=2433")!
        let request = NSURLRequest(url: requestUrl as URL)
        webView.loadRequest(request as URLRequest)
    }

    func webViewDidStartLoad(_ webView: UIWebView) {
        activityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
    
}
