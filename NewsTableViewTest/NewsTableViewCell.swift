//
//  NewsTableViewCell.swift
//  NewsTableViewTest
//
//  Created by pau on 1/11/18.
//  Copyright © 2018 pau. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var article: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //text = ""
        //article.text = ""
        title.lineBreakMode = .byWordWrapping // notice the 'b' instead of 'B'
        title.numberOfLines = 3
        print("Init NewsTableViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
