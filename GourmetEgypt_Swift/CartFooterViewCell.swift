//
//  CartFooterViewCell.swift
//  GourmetEgypt_Swift
//
//  Created by Ashutosh Mishra on 11/05/17.
//  Copyright © 2017 Ashutosh Mishra. All rights reserved.
//

import UIKit

class CartFooterViewCell: UITableViewCell {

    @IBOutlet weak var subTotalStaticLabel: UILabel!
    @IBOutlet weak var subTotalLabel: UILabel!
    @IBOutlet weak var shippingStaticLabel: UILabel!
    @IBOutlet weak var shippingLabel: UILabel!
    @IBOutlet weak var taxStaticLabel: UILabel!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var totalAmountStaticLabel: UILabel!
    @IBOutlet weak var totalAmoutLabel: UILabel!
    @IBOutlet weak var congratulationMessageLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
