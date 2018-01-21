//
//  DisplayNewsViewController.swift
//  NewsTableViewTest
//
//  Created by pau on 1/18/18.
//  Copyright © 2018 pau. All rights reserved.
//

import UIKit
import WebKit
import Fuzi

class DisplayNewsViewController: UIViewController,  WKUIDelegate, WKNavigationDelegate{

    @IBOutlet weak var newsWebView: WKWebView!
    var url : String = ""
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        newsWebView = WKWebView(frame: .zero, configuration: webConfiguration)
        newsWebView.uiDelegate = self
        view = newsWebView
        // Do any additional setup after loading the view.
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        newsWebView.navigationDelegate = self
        print("News URL: " + url)
        do{
            if let newsUrl = URL(string: url ) {
                let siteString = try String(contentsOf: newsUrl, encoding: String.Encoding.utf8)
                //var htmlString = try HTMLDocument(string: siteString, encoding: String.Encoding.utf8)
                newsWebView.loadHTMLString(siteString ,baseURL:  newsUrl)
            }
        }
        catch let error {
            //Error opening URL
            print("Error: \(error)!")
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
