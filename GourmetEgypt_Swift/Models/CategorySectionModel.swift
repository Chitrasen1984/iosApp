//
//  SubCategorySectionModel.swift
//  GourmetEgypt_Swift
//
//  Created by Ashutosh Mishra on 09/05/17.
//  Copyright © 2017 Ashutosh Mishra. All rights reserved.
//

import UIKit

struct CategorySectionModel {
    let id: String
    let title: String
    
    // MARK: Initialization
    init(id:String, title:String) {
        self.id = id
        self.title = title
    }
}
