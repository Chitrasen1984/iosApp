//
//  ItemCollectionTableViewCell.swift
//  GourmetEgypt_Swift
//
//  Created by Susmita Horrow on 30/04/17.
//  Copyright © 2017 Ashutosh Mishra. All rights reserved.
//

import UIKit

class ItemCollectionTableViewCell: UITableViewCell {
	
	@IBOutlet weak var itemCollectionView: UICollectionView!
	let itemCollectionManager: ItemCollectionManager = ItemCollectionManager()

	@IBOutlet weak var headerLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
		
		let nib = UINib(nibName: "ItemCollectionViewCell", bundle: Bundle.main)
		itemCollectionView.register(nib, forCellWithReuseIdentifier: "itemCell")
		let headerNib = UINib(nibName: "ItemCollectionHeaderReusableView", bundle: Bundle.main)
		itemCollectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "ItemCollectionHeader")
		
		itemCollectionView.dataSource = itemCollectionManager
		itemCollectionView.delegate = itemCollectionManager
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

	func configure(itemSection: ItemSection) {
		headerLabel.text = itemSection.name
		let sectionWithoutHeader = ItemSection(name: "", items: itemSection.items)
		itemCollectionManager.itemSections = [sectionWithoutHeader]
		itemCollectionView.reloadData()
	}
}
