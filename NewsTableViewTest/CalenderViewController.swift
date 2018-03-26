//
//  CalenderViewController.swift
//  NewsTableViewTest
//
//  Created by pau on 1/13/18.
//  Copyright © 2018 pau. All rights reserved.
//

import UIKit
import WebKit

class CalenderViewController: UIViewController,  WKUIDelegate, WKNavigationDelegate {

    var url : String = ""
    @IBOutlet weak var gcalender: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gcalender.uiDelegate = self
        let calurl = URL(string: "https://calendar.google.com/calendar/embed?src=helmholtzschule-ffm.net_9nvqfopgdvrspcvj93q2b4p188%40group.calendar.google.com&amp;ctz=Europe/Berlin")
        let request = URLRequest(url: calurl!);
        //view = gcalender
        gcalender.load(request);
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
