//
//  ViewController.swift
//  demo
//
//  Created by MMizogaki on 6/17/16.
//  Copyright © 2016 MMizogaki. All rights reserved.
//

import UIKit
import SystemConfiguration

class ViewController: UIViewController,UIWebViewDelegate {

    var sessionID: String?
    var plementID: String? = "4879_b_233"

    override func viewDidLoad() {
        super.viewDidLoad()

        let adOperation = DLAdOperation()

        adOperation.requestAdInfo(plementID!as String,
            success: {(receiveObject: [NSObject : AnyObject]) in

                print(receiveObject)
                dispatch_async(dispatch_get_main_queue(), {

                    let webView:UIWebView = UIWebView()
                    webView.scalesPageToFit = true
                    webView.delegate = self
                    webView.frame = CGRectMake((CGRectGetWidth(UIScreen.mainScreen().bounds)-320)/2,CGRectGetHeight(UIScreen.mainScreen().bounds)-50,320,50)
                    webView.loadRequest(NSURLRequest(URL:NSURL(string:receiveObject["curl"] as! String)!))
                    self.sessionID = receiveObject["session"] as! String!
                    self.view.addSubview(webView)

                    let button = UIButton()
                    button.frame = webView.frame
                    button.addTarget(self, action: "adClick:", forControlEvents: UIControlEvents.TouchUpInside)
                    self.view.addSubview(button)
                    webView.bringSubviewToFront(button)

                })
            },
            failure: {
                print("failure")
            })
    }

    func webViewDidFinishLoad(webView: UIWebView) {
        DLAdOperation.sendImp(self.plementID as String!, impStatus: true, sessionId: self.sessionID as String!)
    }

    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        DLAdOperation.sendImp(self.plementID as String!, impStatus: false, sessionId: self.sessionID as String!)
    }

    func adClick(button: UIButton) {
        DLAdOperation.sendClick(self.plementID as String!, sessionId: self.sessionID as String!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

