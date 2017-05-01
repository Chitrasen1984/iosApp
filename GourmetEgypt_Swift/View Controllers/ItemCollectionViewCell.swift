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

	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	
	@IBAction func handleTapOnFavourite(_ sender: Any) {
	
	}
	
	@IBAction func handleTapOnAdd(_ sender: Any) {
	
	}
	
	func configure(item: Item) {
		titleLabel.text = item.name
		priceLabel.text = item.price
		favouriteButton.isSelected = item.isFavorited
	}
}
