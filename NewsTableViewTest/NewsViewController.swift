//
//  ViewController.swift
//  NewsTableViewTest
//
//  Created by pau on 1/11/18.
//  Copyright © 2018 pau. All rights reserved.
//

import UIKit
import Fuzi

//
//  NewsController.swift
//  HelmHoltzApp
//
//  Created by pau on 01.07.17.
//  Copyright © 2017 pau. All rights reserved.
//

import UIKit


class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
  
    
    @IBOutlet weak var tableView: UITableView!
    
    var news = [News]()
    var dataFetched : Bool = false
    
    override func viewDidLoad() {
        // This view controller itself will provide the delegate methods and row data for the table view
        super.viewDidLoad()
        //tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        createNewsTable()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a new cell if needed or reuse an old one
        let cellIdentifier = "cell"
        //print("New Title")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,for: indexPath) as? NewsTableViewCell else {
            fatalError("The dequeued cell is not an instance of NArticleTableViewCell.")
        }
        let nNew = news[indexPath.row]
        /*if let title = cell.headline{
            if let article = cell.articleText {
         */
        
        if let title = cell.title {
                print("New Title")
                title.text = nNew.title
            
        }
        if let article = cell.article {
            print("New Title")
                article.text = nNew.article
            
        }
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
        
        let url =  news[indexPath.row].url!
        print("Url: " + url)
        if let displayNewsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "displaynews") as? DisplayNewsViewController{
            displayNewsViewController.url = url
            
            if let navigator = navigationController {
                navigator.pushViewController(displayNewsViewController, animated: true)
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func createNewsTable(){
        var newNews : News
        var i : Int
        i = 0
        guard let hhsurl = URL(string: "http://www.helmholtzschule-frankfurt.de") else
        {
            print ("Error - not a valid URL")
            return
        }
        do
        {
            let htmlString = try  String(contentsOf: hhsurl, encoding: String.Encoding.utf8)
            //print("htmlString: " + htmlString)
            let newsNodes = htmlString.components(separatedBy: "Weiterlesen")
            //print("NewsNodes Count:" + String(newsNodes.count))
            
            for nodeString in newsNodes {
                let nodeRange  = nodeString.range(of: "node",options:.backwards)
                let newUpper = nodeString.index((nodeRange?.upperBound)!, offsetBy: 4)
                print("http://www.helmholtzschule-frankfurt.de/\(nodeString[(nodeRange?.lowerBound)!..<newUpper])")
                let urlString = "http://www.helmholtzschule-frankfurt.de/\(nodeString[(nodeRange?.lowerBound)!..<newUpper])"
                guard let newsUrl = URL(string: urlString ) else
                {
                    print("No NewsUrl")
                    print ("http://www.helmholtzschule-frankfurt.de/\(nodeString[(nodeRange?.lowerBound)!..<newUpper])")
                    if(news.count > 0){
                        /*
                        for new in news {
                            //print("Title: " + new.title!)
                            //print("Text: " + new.article!)
                        }*/
                        print("reloadData")
                        dataFetched = true
                        tableView.reloadData()
                    }
                    return
                }
                do
                {
                    let newHtmlString = try String(contentsOf: newsUrl, encoding: String.Encoding.utf8)
                    let doc = try HTMLDocument(string: newHtmlString, encoding: String.Encoding.utf8)
                    if let title = doc.firstChild(css: "title"){
                        if let article = doc.firstChild(css: "article"){
                            if let text = article.firstChild(xpath: "div [@class='node__content clearfix']"){
                                newNews = News(title: title.stringValue.trimmingCharacters(in: .whitespacesAndNewlines)  ,  article: text.stringValue.trimmingCharacters(in: .whitespacesAndNewlines), url: urlString)!
                                news.append(newNews)
                                i=i+1
                            }
                        }
                    }
                }
            }
            print("reloadData")
            dataFetched = true
            tableView.reloadData()
            
        }
            
 
            
        catch let error {
            //Error opening URL
            print("Error: \(error)!")
        }
        
    }
}

