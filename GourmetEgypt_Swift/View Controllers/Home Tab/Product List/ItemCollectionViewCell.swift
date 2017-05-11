//
//  ItemCollectionViewCell.swift
//  GourmetEgypt_Swift
//
//  Created by Susmita Horrow on 30/04/17.
//  Copyright © 2017 Ashutosh Mishra. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {

	@IBOutlet weak var itemImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var priceLabel: UILabel!
	@IBOutlet weak var favouriteButton: UIButton!
	@IBOutlet weak var addButton: UIButton!
    static let cellIdentifier = "itemCell"
    static let nibName = "ItemCollectionViewCell"

	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	
	@IBAction func handleTapOnFavourite(_ sender: Any) {
	
	}
	
	@IBAction func handleTapOnAdd(_ sender: Any) {
	
	}
	
	func configure(item: ProductListModel) {
        titleLabel.text = item.title
        priceLabel.text = item.price
        favouriteButton.isSelected = item.isFavourite
        
        self.layer.shadowOffset = CGSize(width: 1, height: 0);
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 5;
        self.layer.shadowOpacity = 0.25;
        self.clipsToBounds = false
        self.layer.masksToBounds = false
		
	}
}
