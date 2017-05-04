//
//  CategoryModel.swift
//  GourmetEgypt_Swift
//
//  Created by Ashutosh Mishra on 04/05/17.
//  Copyright © 2017 Ashutosh Mishra. All rights reserved.
//

import UIKit

class CategoryModel: NSObject {
    
    let id:String
    let title: String
    let imagePath: String
    var subCategories:[CategoryModel]
    
    // MARK: Initialization
    init?(id:String, title:String, imagePath:String, subCategories:[CategoryModel]) {
        self.id = id
        self.title = title
        self.imagePath = imagePath
        self.subCategories = subCategories
        super.init()
        
        
    }
    

}
