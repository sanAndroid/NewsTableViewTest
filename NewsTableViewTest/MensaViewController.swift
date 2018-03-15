//
//  MensaViewController.swift
//  NewsTableViewTest
//
//  Created by pau on 1/17/18.
//  Copyright © 2018 pau. All rights reserved.
//

import UIKit
import WebKit
import Fuzi

class MensaViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    weak var observe : NSObjectProtocol?
    
    override func viewDidLoad() {
       super.viewDidLoad()
        do {
            
            let mensaUrl = URL(string: "https://www.liebigmensaservice.de/active/formulare/speiseplan.php?mandant=asbhelmholtz")
            let htmlString = try String(contentsOf: mensaUrl! , encoding: String.Encoding.ascii)
           
            //let doc = try HTMLDocument(string:  htmlString, encoding: String.Encoding.utf8)
            print("HtmlDoc")
            let rangeOfPdf = htmlString.range(of: "sppl-asbhelmholtz")!
            //print(htmlString.index((rangeOfPdf.upperBound), offsetBy: 10))
            print(htmlString[rangeOfPdf.upperBound...htmlString.index((rangeOfPdf.upperBound), offsetBy: 9)])
            var pdfIndex : String
            var index : Int = 7
            repeat{
                pdfIndex = String(htmlString[rangeOfPdf.upperBound...htmlString.index((rangeOfPdf.upperBound), offsetBy: index)])
                index = index + 1
            } while(!pdfIndex.hasSuffix( "pdf") && index < 30)
            let urlString = "https://www.liebigmensaservice.de/speiseplan/sppl-asbhelmholtz" + pdfIndex
            print(urlString)
            guard let url = URL(string:  urlString ) else
            {
                print("Initialisation of URL failed")
                return
            }
            let request = URLRequest(url : url)
            webView.load(request)
        }
        catch let error {
            //Error opening URL
            print("Error: \(error)!")
            return
            //return "Error: \(error)!"
        }

       
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
