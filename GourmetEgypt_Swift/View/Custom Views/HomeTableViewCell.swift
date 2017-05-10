//
//  HomeTableViewCell.swift
//  GourmetEgypt_Swift
//
//  Created by Ashutosh Mishra on 27/04/17.
//  Copyright © 2017 Ashutosh Mishra. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var bannerType1: UIView!
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var bannerType2: UIView!
    @IBOutlet weak var banner2TextLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    @IBAction func shopNowButtonTapped(_ sender: Any) {
        
    }
    
    public func configure(with banner: BannerModel,indexPath: NSIndexPath) {
        let bannnerObj = banner
        self.headingLabel.text = bannnerObj.title
        self.banner2TextLabel.text = bannnerObj.bannerDescription
        // Make sure you have this code
        //        cell.delegate = self;
        if indexPath.row==0 {
            self.bannerType2.isHidden = true;
            self.bannerType1.isHidden = false;
        }
        else {
            self.bannerType1.isHidden = true;
            self.bannerType2.isHidden = false;
        }
        
        self.selectionStyle = UITableViewCellSelectionStyle.none
    }

}
