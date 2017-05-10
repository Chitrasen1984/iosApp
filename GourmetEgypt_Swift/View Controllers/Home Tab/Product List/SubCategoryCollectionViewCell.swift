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
    static let cellIdentifier = "segmentCell"
    static let nibName = "SubCategoryCollectionViewCell"

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
            subCategoryLabel.textColor = isSelected ? UIColor(red: 103.0/255.0, green: 167.0/255, blue: 132.0/255.0, alpha: 1.0) : UIColor.black
        }
    }

	func configure(category: CategoryModel) {
        subCategoryLabel.text = category.title
    }
}
