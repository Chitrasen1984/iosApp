//
//  CategoryModel.swift
//  GourmetEgypt_Swift
//
//  Created by Ashutosh Mishra on 04/05/17.
//  Copyright © 2017 Ashutosh Mishra. All rights reserved.
//

import UIKit

class CategoryModel: NSObject {
    
    let id: String
    let title: String
    let imagePath: String
    var subCategories: [CategoryModel]
    
    init(id: String, title: String, imagePath: String, subCategories: [CategoryModel]) {
        self.id = id
        self.title = title
        self.imagePath = imagePath
        self.subCategories = subCategories
        super.init()
    }
    
    init(dictionary: [String: Any]) {
        id = dictionary["id"] as! String
        imagePath = dictionary["image_path"] as! String
        title = dictionary["title"] as! String
        let subCategoryArray = dictionary["sub_categories"] as! [[String: Any]]
        subCategories = subCategoryArray.map({ dict in
            CategoryModel(dictionary: dict)
        })
    }
    
    func categoryNode() -> Node<CategoryModel> {
        let node = Node<CategoryModel>(value: self, childrenNode: self.subCategories.map({$0.categoryNode()}))
        return node
    }
}
