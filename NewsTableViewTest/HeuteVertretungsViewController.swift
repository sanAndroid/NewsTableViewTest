//
//  VertretungsViewController.swift
//  NewsTableViewTest
//
//  Created by pau on 1/13/18.
//  Copyright © 2018 pau. All rights reserved.
//

import UIKit
import WebKit
import Fuzi



class HeuteVertretungsViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {

    @IBOutlet weak var dayButton: UIButton!
    let html = "<html>...</html>"
    var url : String = ""
    var todayHtml : String = ""
    var tomorrowHtml : String = ""
    var today : Bool = true
    var teacher : Bool = false

    @IBOutlet weak var vPlan: WKWebView!
    @IBOutlet weak var editPassword: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  
        
        if let pwd =  UserDefaults.standard.string(forKey: "HelmholtzPWD") {
            if pwd == "C1602Z" {
                self.teacher = true
            }
        }
        
        vPlan.uiDelegate = self
        Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        todayHtml = getToday()
        todayHtml = todayHtml.replacingOccurrences(of: "content=\"12;", with: "content=\"120;")
        vPlan.loadHTMLString(todayHtml , baseURL:  URL(string: "http://gymbase.net/MatheApp/heuteS1.php?auth=sdffsduijvxchpqwkcyl")  )
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func update() {
         vPlan.loadHTMLString(todayHtml , baseURL:  URL(string: "http://gymbase.net/MatheApp/heuteS1.php?auth=sdffsduijvxchpqwkcyl")  )
    }
    func getToday() -> String {
        var htmlString : String
        var today : String = ""
        
        // Get the first page and initialize the htmlstring with it
        // Get the current date (today) in order to compare it with the other pages' date
 
        guard let Todayurl1 = URL(string: "http://gymbase.net/MatheApp/heuteS1.php?auth=sdffsduijvxchpqwkcyl") else {
            print("vurl not valid - contact helmholtz admin")
            return "Vurl not valid - contact helmholtz admin"
        }
        do{
            let htmlString1 = try String(contentsOf: Todayurl1 , encoding: String.Encoding.utf8)
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
        guard let vTodayurl2 = URL(string: "http://gymbase.net/MatheApp/heuteS2.php?auth=sdffsduijvxchpqwkcyl") else {
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
        guard let vTodayurl3 = URL(string: "http://gymbase.net/MatheApp/heuteS3.php?auth=sdffsduijvxchpqwkcyl") else {
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
        guard let vTodayurl4 = URL(string: "http://gymbase.net/MatheApp/heuteS4.php?auth=sdffsduijvxchpqwkcyl") else {
            print("vurl not valid - contact helmholtz admin")
            return "Vurl not valid - contact helmholtz admin"
        }
        do {
            let htmlString4 = try String(contentsOf: vTodayurl4 , encoding: String.Encoding.utf8)
            let doc = try HTMLDocument(string:  htmlString4, encoding: String.Encoding.utf8)
            print("Fourth Sons")
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
    private func getAuthURL(number: int){
        
    }
    
    
    @IBAction func editPassword(_ sender: Any) {
        let editPasswordVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController( withIdentifier: "passwordPopUp") as! NewPasswordViewController
        self.addChildViewController(editPasswordVC)
        editPasswordVC.view.frame = self.view.frame
        self.view.addSubview(editPasswordVC.view)
        editPasswordVC.didMove(toParentViewController: self)
        
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
