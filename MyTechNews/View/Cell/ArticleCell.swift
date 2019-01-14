//
//  ArticleCell.swift
//  MyTechNews
//
//  Created by Naoki Muroya on 2019/01/12.
//  Copyright © 2019 Naoki. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    
    @IBOutlet weak var titleBody: UILabel!
    var url : String = ""
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code goes here
    }
    
}
