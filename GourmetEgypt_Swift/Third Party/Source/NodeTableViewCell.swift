//
//  NodeTableViewCell.swift
//  SHTreeViewManager
//
//  Created by Susmita Horrow on 07/04/17.
//  Copyright © 2017 hsusmita. All rights reserved.
//

import UIKit

class NodeTableViewCell: UITableViewCell {
	
	static let cellIdentifier = "NodeTableViewCell"
	fileprivate var node: Node<MenuNode>?
	
	@IBOutlet weak var separatorLeftConstraint: NSLayoutConstraint!
	@IBOutlet weak var label: UILabel!
    @IBOutlet weak var expandImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
	
	@IBAction func didTapOnCell(_ sender: Any) {
        
	}
}

extension NodeTableViewCell: NodeCell {
    func configure(with node: TreeNode, level: Int, expanded: Bool) {
		if let treeNode = node as? Node<MenuNode> {
            let value = treeNode.value
			label.text = value.title
			self.node = treeNode
            expandImageView.isHidden = treeNode.children.isEmpty
			self.separatorLeftConstraint.constant = CGFloat(level+1) * 10.0
		}
        expandImageView.image = expanded ? UIImage(named: "minus") : UIImage(named: "plus")
	}
}
