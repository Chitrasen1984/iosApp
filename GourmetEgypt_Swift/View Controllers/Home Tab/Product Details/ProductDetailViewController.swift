//
//  ProductDetailViewController.swift
//  GourmetEgypt_Swift
//
//  Created by Ashutosh Mishra on 10/05/17.
//  Copyright © 2017 Ashutosh Mishra. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var productDetailTableView: UITableView!
    var item: Item!
    var weeklySection: ItemSection?
    var youMayLikeSection: ItemSection?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productDetailTableView.rowHeight = UITableViewAutomaticDimension
        productDetailTableView.estimatedRowHeight = 400.0
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.productDetailTableView.register(UINib(nibName: "ProductDetailTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "ProductDetailCell")
        self.productDetailTableView.register(UINib(nibName: "ItemCollectionTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "ItemCollectionTableViewCell")
        
        let items = [ProductListModel(id: "1", title: "South African Angus Veel Rump Cap Roast", isFavourite: false, imagePath: "", price: "EGP 184.00"),
                     ProductListModel(id: "1", title: "South African Angus Veel Rump Cap Roast", isFavourite: false, imagePath: "", price: "EGP 184.00"),
                     ProductListModel(id: "1", title: "South African Angus Veel Rump Cap Roast", isFavourite: false, imagePath: "", price: "EGP 184.00"),
                     ProductListModel(id: "1", title: "South African Angus Veel Rump Cap Roast", isFavourite: false, imagePath: "", price: "EGP 184.00")]
        weeklySection = ItemSection(name: "Weekly", items: items)
        youMayLikeSection = ItemSection(name: "You may like", items: items)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension ProductDetailViewController: UITableViewDataSource {
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

extension ProductDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? UITableViewAutomaticDimension : 300.0
    }
}
