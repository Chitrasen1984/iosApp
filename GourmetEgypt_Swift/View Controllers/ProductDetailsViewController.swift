//
//  ProductDetailsViewController.swift
//  GourmetEgypt_Swift
//
//  Created by Susmita Horrow on 30/04/17.
//  Copyright © 2017 Ashutosh Mishra. All rights reserved.
//

import UIKit

class ProductDetailsViewController: UIViewController {

	@IBOutlet weak var productDetailTableView: UITableView!
	var item: Item!
	var weeklySection: ItemSection?
	var youMayLikeSection: ItemSection?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		productDetailTableView.rowHeight = UITableViewAutomaticDimension
		productDetailTableView.estimatedRowHeight = 400.0
		
		let items = [Item(name: "South African Angus Veel Rump Cap Roast", price: "EGP 184.00", isFavorited: false, imageUrl: ""),
		             Item(name: "South African Angus Veel Rump Cap Roast", price: "EGP 184.00", isFavorited: false, imageUrl: ""),
		             Item(name: "South African Angus Veel Rump Cap Roast", price: "EGP 184.00", isFavorited: false, imageUrl: ""),
		             Item(name: "South African Angus Veel Rump Cap Roast", price: "EGP 184.00", isFavorited: false, imageUrl: "")]
		weeklySection = ItemSection(name: "Weekly", items: items)
		youMayLikeSection = ItemSection(name: "You may like", items: items)
		
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ProductDetailsViewController: UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		switch section {
		case 0:
			return 1
		default:
			return 2
		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if indexPath.section == 0 {
			let cell = tableView.dequeueReusableCell(withIdentifier: "ProductDetailCell", for: indexPath)
			return cell
		} else {
			let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCollectionTableViewCell", for: indexPath)
			if let itemCell = cell as? ItemCollectionTableViewCell {
				let itemSection = indexPath.row == 0 ? weeklySection! : youMayLikeSection!
				itemCell.configure(itemSection: itemSection)
			}
			return cell
		}
	}
}

extension ProductDetailsViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return indexPath.section == 0 ? UITableViewAutomaticDimension : 300.0
	}
}
