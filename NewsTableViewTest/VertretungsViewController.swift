//
//  VertretungsViewController.swift
//  NewsTableViewTest
//
//  Created by pau on 1/13/18.
//  Copyright © 2018 pau. All rights reserved.
//

import UIKit
import WebKit

class VertretungsViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {

    var url : String = ""
    @IBOutlet weak var vPlan: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        vPlan.uiDelegate = self
        guard let vTodayurl1 = try URL(string: "http://gymbase.net/MatheApp/heuteS1.php?auth=sdffsduijvxchpqwkcyl") else {
              print("vurl not valid - contact helmholtz admin")
              return
        }
        
        let htmlString1 = try String(contentsOf: vTodayurl1 , encoding: String.Encoding.utf8) else {
            print ("htmlString: " + htmlString1)
        }
        /*
        guard let vTodayurl2 = try URL(string: "http://gymbase.net/MatheApp/heuteS2.php?auth=sdffsduijvxchpqwkcyl") else {
            print("vurl not valid - contact helmholtz admin")
            return
        }
        guard let vTodayurl3 = try URL(string: "http://gymbase.net/MatheApp/heuteS3.php?auth=sdffsduijvxchpqwkcyl") else {
            print("vurl not valid - contact helmholtz admin")
            return
        }
        guard let vTodayurl4 = try URL(string: "http://gymbase.net/MatheApp/heuteS4.php?auth=sdffsduijvxchpqwkcyl") else {
            print("vurl not valid - contact helmholtz admin")
            return
        }
        */
        catch error {
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
