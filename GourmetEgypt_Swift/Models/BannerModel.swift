//
//  BannerModel.swift
//  GourmetEgypt_Swift
//
//  Created by Ashutosh Mishra on 04/05/17.
//  Copyright © 2017 Ashutosh Mishra. All rights reserved.
//

import UIKit

class BannerModel: NSObject {
    let id: String
    let title: String
    let bannerDescription: String
    let imagePath: String
    let bannerType: String
   
    // MARK: Initialization
    init(id:String, title:String, bannerDescription:String, imagePath:String, bannerType:String) {
        self.id = id
        self.title = title
        self.bannerDescription = bannerDescription
        self.imagePath = imagePath
        self.bannerType = bannerType
        super.init()
        
        
    }

}
