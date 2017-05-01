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

    @IBAction func addToCartButtonPressed(_ sender: Any) {
        
    }
   
    @IBAction func addToFavouriteButtonTapped(_ sender: Any) {
    }
    
    
    @IBAction func shareButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func compareButtonPressed(_ sender: Any) {
        
    }
    
}
