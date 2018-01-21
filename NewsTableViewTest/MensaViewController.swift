//
//  MensaViewController.swift
//  NewsTableViewTest
//
//  Created by pau on 1/17/18.
//  Copyright © 2018 pau. All rights reserved.
//

import UIKit
import WebKit

class MensaViewController: UIViewController {
    

 
    @IBOutlet weak var webView: WKWebView!
    
    weak var observe : NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
 

        guard let url = URL(string: "https://www.liebigmensaservice.de/speiseplan/sppl-asbhelmholtz-32018.pdf") else
        {
            print("Initialisation of URL failed")
            return
        }
        let request = URLRequest(url : url)
        webView.load(request)
   

       
        // Do any additional setup after loading the view.
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
