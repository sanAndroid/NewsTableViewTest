//
//  News.swift
//  HelmHoltzApp
//
//  Created by pau on 7/8/17.
//  Copyright © 2017 pau. All rights reserved.
//

import UIKit

class News {
    
    //MARK: Properties
    
    var title: String?
    var article: String?
    var url : String?
//    var thumbnail: UImage?
    
    init?(title: String, article: String, url: String) {
        if title.isEmpty {
            return nil
        }
        self.title = title
        self.article = article
        self.url = url
    }
    
}
