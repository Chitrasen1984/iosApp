//
//  SubCategoryItemsModel.swift
//  GourmetEgypt_Swift
//
//  Created by Ashutosh Mishra on 09/05/17.
//  Copyright © 2017 Ashutosh Mishra. All rights reserved.
//

import UIKit

struct ProductListModel {
    let id: String
    let title: String
    let isFavourite: Bool
    let imagePath: String
    let price: String
    
    // MARK: Initialization
    init(id:String, title:String, isFavourite:Bool, imagePath:String, price:String) {
        self.id = id
        self.title = title
        self.isFavourite = isFavourite
        self.imagePath = imagePath
        self.price = price
    }
}
