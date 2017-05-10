//
//  HomeBannerCell.swift
//  GourmetEgypt_Swift
//
//  Created by Ashutosh Mishra on 09/05/17.
//  Copyright © 2017 Ashutosh Mishra. All rights reserved.
//

import UIKit
//import SDWebImage

class HomeBannerCell: UITableViewCell {
    
    @IBOutlet var bannerImage: UIImageView!
    
    @IBOutlet weak var bannerType1: UIView!
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var bannerType2: UIView!
    @IBOutlet weak var banner2TextLabel: UILabel!
    
    static let CellIdentifier = "HomeBannerCellIdentifier"
    static let NibName = "HomeBannerCell"
    
    var banner : BannerModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func shopNowButtonTapped(_ sender: Any) {
        
    }
    
    public func configure(banner: BannerModel) {
        
        self.banner = banner
        
//        self.bannerImage?.sd_setImage(with: URL(string: banner.imagePath), placeholderImage: nil)
        self.headingLabel?.text = banner.title
        self.banner2TextLabel?.text = banner.bannerDescription
        
        self.bannerType1?.isHidden = (banner.bannerType == "product") ? false : true
        self.bannerType2?.isHidden = (banner.bannerType == "banner") ? false : true
        
        self.selectionStyle = UITableViewCellSelectionStyle.none
    }
}
