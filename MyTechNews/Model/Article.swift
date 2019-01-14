//
//  News.swift
//  MyTechNews
//
//  Created by Naoki Muroya on 2019/01/10.
//  Copyright © 2019 Naoki. All rights reserved.
//

import Foundation

struct Article: Codable {
    
    let title : String
    let url : String
    
}

struct ArticlesListResult: Codable {
    
    let status : String
    let articles : [Article]
    let totalResults : Int
    
}
