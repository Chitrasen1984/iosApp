//
//  SubCategoryCollectionViewCell.swift
//  GourmetEgypt_Swift
//
//  Created by Susmita Horrow on 29/04/17.
//  Copyright © 2017 Ashutosh Mishra. All rights reserved.
//

import UIKit

class SubCategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var subCategoryLabel: UILabel!
	@IBOutlet weak var lineView: UIView!

	override func awakeFromNib() {
        super.awakeFromNib()
    }
	
	override var isSelected: Bool {
		get {
			return super.isSelected
		}
		set {
			super.isSelected = newValue
			lineView.isHidden = !newValue
		}
	}

	func configure(category: String) {
        subCategoryLabel.text = category
    }
}
