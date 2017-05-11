//
//  ProductDetailTableViewCell.swift
//  GourmetEgypt_Swift
//
//  Created by Susmita Horrow on 30/04/17.
//  Copyright © 2017 Ashutosh Mishra. All rights reserved.
//

import UIKit

class ProductDetailTableViewCell: UITableViewCell {

	@IBOutlet weak var productImageView: UIImageView!
	@IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var productQuatityLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var numberOfProductsTextField: UITextField!
    @IBOutlet weak var previousPriceLabel: UILabel!
    @IBOutlet weak var offerNameLabel: UILabel!
    static let cellIdentifier = "productDetailCell"
    static let nibName = "ProductDetailTableViewCell"
    
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var compareButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(productDetailObj: ProductDetailModel) {
        self.productTitleLabel.text = productDetailObj.productName
        self.descriptionLabel.text = productDetailObj.productDescription
        self.productQuatityLabel.text = productDetailObj.productQuantity
        self.productPriceLabel.text = String(productDetailObj.productPrice)
        self.numberOfProductsTextField.text = "1"
        self.previousPriceLabel.isHidden = true
        self.offerNameLabel.text = productDetailObj.offerName
    }

    //MARK: IBAction Methods:-
    @IBAction func addToCartButtonPressed(_ sender: Any) {
        
    }
   
    @IBAction func addToFavouriteButtonTapped(_ sender: Any) {
    }
    
    
    @IBAction func shareButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func compareButtonPressed(_ sender: Any) {
        
    }
    
}
