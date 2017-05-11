//
//  ItemCollectionHeaderReusableView.swift
//  GourmetEgypt_Swift
//
//  Created by Susmita Horrow on 30/04/17.
//  Copyright © 2017 Ashutosh Mishra. All rights reserved.
//

import UIKit

class ItemCollectionHeaderReusableView: UICollectionReusableView {

	@IBOutlet weak var titleLabel: UILabel!
    static let reuseIdentifier = "ItemCollectionHeader"
    static let nibName = "ItemCollectionHeaderReusableView"
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
