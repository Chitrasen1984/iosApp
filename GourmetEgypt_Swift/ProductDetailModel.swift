//
//  ProductDetailModel.swift
//  GourmetEgypt_Swift
//
//  Created by Ashutosh Mishra on 11/05/17.
//  Copyright © 2017 Ashutosh Mishra. All rights reserved.
//

import Foundation
import UIKit

struct ProductDetailModel {
    let productName: String
    let productDescription: String?
    let productQuantity: String
    let productPrice: Float
    let productPurchaseLimit:Int?
    let offerName: String?
    let revisedPrice: Float?
    let offerDescription: String?
    let noOfItemsAlreadyInCart: Int?
    let productImageURL: String?
    
    init(productName: String,productDescription: String?, productQuantity: String, productPrice: Float, productPurchaseLimit: Int?, offerName: String?, revisedPrice: Float?, offerDescription: String?, noOfItemsAlreadyInCart: Int?, productImageURL: String?) {
        self.productName = productName;
        self.productDescription = productDescription;
        self.productQuantity = productQuantity;
        self.productPrice = productPrice;
        self.productPurchaseLimit = productPurchaseLimit;
        self.offerName = offerName;
        self.revisedPrice = revisedPrice;
        self.offerDescription = offerDescription;
        self.noOfItemsAlreadyInCart = noOfItemsAlreadyInCart;
        self.productImageURL = productImageURL;
    }
}
