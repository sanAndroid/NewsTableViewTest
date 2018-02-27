//
//  MorgenVertretungsViewController.swift
//  NewsTableViewTest
//
//  Created by pau on 1/17/18.
//  Copyright © 2018 pau. All rights reserved.
//

import UIKit

import UIKit
import WebKit
import Fuzi

class MorgenVertretungsViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    

    let html = "<html>...</html>"
    var url : String = ""
    var tomorrowHtml : String = ""
    @IBOutlet weak var vplan: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vplan.uiDelegate = self
        Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        tomorrowHtml = getToday()
        tomorrowHtml = tomorrowHtml.replacingOccurrences(of: "content=\"12;", with: "content=\"120;")
        print(tomorrowHtml)
        vplan.loadHTMLString(tomorrowHtml , baseURL:  URL(string: "http://gymbase.net/MatheApp/morgenS1.php?auth=sdffsduijvxchpqwkcylft")  )
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func update() {
        vplan.loadHTMLString(tomorrowHtml , baseURL:  URL(string: "http://gymbase.net/MatheApp/morgenS1.php?auth=sdffsduijvxchpqwkcyl")  )
    }
    
    func getToday() -> String {
        var htmlString : String
        var today : String = ""
        
        // Get the first page and initialize the htmlstring with it
        // Get the current date (today) in order to compare it with the other pages' date
        guard let vTodayurl1 = URL(string: "http://gymbase.net/MatheApp/morgenS1.php?auth=sdffsduijvxchpqwkcyl") else {
            print("vurl not valid - contact helmholtz admin")
            return "Vurl not valid - contact helmholtz admin"
        }
        do{
            let htmlString1 = try String(contentsOf: vTodayurl1 , encoding: String.Encoding.utf8)
            htmlString = htmlString1
            let doc = try HTMLDocument(string:  htmlString1, encoding: String.Encoding.utf8)
            print("FirstChild")
            if let tDay = doc.firstChild(css: "div")?.stringValue {
                today = tDay.components(separatedBy: " ")[0].trimmingCharacters(in: .whitespacesAndNewlines)
                print("today: " + today)
            }
        }
        catch let error {
            //Error opening URL
            print("Error: \(error)!")
            return "Error"
        }
        
        
        // Check if the second Website contains data for today
        guard let vTodayurl2 = URL(string: "http://gymbase.net/MatheApp/morgenS2.php?auth=sdffsduijvxchpqwkcyl") else {
            print("vurl not valid - contact helmholtz admin")
            return "Vurl not valid - contact helmholtz admin"
        }
        do {
            let htmlString2 = try String(contentsOf: vTodayurl2 , encoding: String.Encoding.utf8)
            let doc = try HTMLDocument(string:  htmlString2, encoding: String.Encoding.utf8)
            print("Second Sons")
            if let tDay = doc.firstChild(css: "div")?.stringValue {
                print(tDay.components(separatedBy: " ")[0].trimmingCharacters(in: .whitespacesAndNewlines))
                if( tDay.components(separatedBy: " ")[0].trimmingCharacters(in: .whitespacesAndNewlines) == today){
                    htmlString.append(htmlString2)
                }
            }
        }
        catch let error {
            //Error opening URL
            print("Error: \(error)!")
            return "Error: \(error)!"
        }
        
        
        // Check if the third page contains data for today and append to the htmlstring if the case
        guard let vTodayurl3 = URL(string: "http://gymbase.net/MatheApp/morgenS3.php?auth=sdffsduijvxchpqwkcyl") else {
            print("vurl not valid - contact helmholtz admin")
            return "Vurl not valid - contact helmholtz admin"
        }
        do {
            let htmlString3 = try String(contentsOf: vTodayurl3 , encoding: String.Encoding.utf8)
            let doc = try HTMLDocument(string:  htmlString3, encoding: String.Encoding.utf8)
            print("Second Sons")
            if let tDay = doc.firstChild(css: "div")?.stringValue {
                print(tDay.components(separatedBy: " ")[0].trimmingCharacters(in: .whitespacesAndNewlines))
                if( tDay.components(separatedBy: " ")[0].trimmingCharacters(in: .whitespacesAndNewlines) == today){
                    htmlString.append(htmlString3)
                }
            }
        }
        catch let error {
            //Error opening URL
            print("Error: \(error)!")
            return "Error: \(error)!"
        }
        
        
        // Check if the fourth page contains data for today and append to the htmlstring if the case
        guard let vTodayurl4 = URL(string: "http://gymbase.net/MatheApp/morgenS4.php?auth=sdffsduijvxchpqwkcyl") else {
            print("vurl not valid - contact helmholtz admin")
            return "Vurl not valid - contact helmholtz admin"
        }
        do {
            let htmlString4 = try String(contentsOf: vTodayurl4 , encoding: String.Encoding.utf8)
            let doc = try HTMLDocument(string:  htmlString4, encoding: String.Encoding.utf8)
            print("Second Sons")
            if let tDay = doc.firstChild(css: "div")?.stringValue {
                print(tDay.components(separatedBy: " ")[0].trimmingCharacters(in: .whitespacesAndNewlines))
                if( tDay.components(separatedBy: " ")[0].trimmingCharacters(in: .whitespacesAndNewlines) == today){
                    htmlString.append(htmlString4)
                }
            }
        }
        catch let error {
            //Error opening URL
            print("Error: \(error)!")
            return "Error: \(error)!"
        }
        return htmlString
    }

}
