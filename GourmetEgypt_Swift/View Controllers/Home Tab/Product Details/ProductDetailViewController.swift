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
    var productListObj: ProductListModel!
    var weeklySection: ItemSection?
    var youMayLikeSection: ItemSection?
    var productDetailObj: ProductDetailModel!
    static let nibName = "ProductDetailViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        productDetailTableView.rowHeight = UITableViewAutomaticDimension
        productDetailTableView.estimatedRowHeight = 400.0
        self.automaticallyAdjustsScrollViewInsets = false
        self.productDetailTableView.keyboardDismissMode = UIScrollViewKeyboardDismissMode.onDrag
        self.navigationItem.title = productListObj.title

        let navigationTitleFont = UIFont(name: "HelveticaNeue-Medium", size: 15)!
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: navigationTitleFont]
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named:"Cart"), style: .plain, target: self, action: #selector(cartButtonTapped))
        self.navigationItem.rightBarButtonItem?.imageInsets = UIEdgeInsetsMake(10, 21, 6, 1)
    
        self.productDetailObj = ProductDetailModel(productName: productListObj.title, productDescription: "Chilled Aussie Beef Shabu Sirloin Chilled Aussie Beef Shabu Sirloin Chilled Aussie Beef Shabu Sirloin Chilled Aussie Beef Shabu SirloinChilled Aussie Beef Shabu Sirloin Chilled Aussie Beef Shabu Sirloin Chilled Aussie Beef Shabu Sirloin Chilled Aussie Beef Shabu Sirloin Chilled Aussie Beef Shabu Sirloin Chilled Aussie Beef Shabu SirloinChilled Aussie Beef Shabu Sirloin Chilled Aussie Beef Shabu Sirloin", productQuantity: "1Kg", productPrice: 527.00, productPurchaseLimit: nil, offerName: "POPULAR", revisedPrice: nil, offerDescription: nil, noOfItemsAlreadyInCart: 1, productImageURL: "www.google.com")
        
        
        self.productDetailTableView.register(UINib(nibName: ProductDetailTableViewCell.nibName, bundle: Bundle.main), forCellReuseIdentifier: ProductDetailTableViewCell.cellIdentifier)
        self.productDetailTableView.register(UINib(nibName: ItemCollectionTableViewCell.nibName, bundle: Bundle.main), forCellReuseIdentifier: ItemCollectionTableViewCell.cellIdentifier)
        
        let items = [ProductListModel(id: "1", title: "South African Angus Veel Rump Cap Roast", isFavourite: false, imagePath: "", price: "EGP 184.00"),
                     ProductListModel(id: "1", title: "South African Angus Veel Rump Cap Roast", isFavourite: false, imagePath: "", price: "EGP 184.00"),
                     ProductListModel(id: "1", title: "South African Angus Veel Rump Cap Roast", isFavourite: false, imagePath: "", price: "EGP 184.00"),
                     ProductListModel(id: "1", title: "South African Angus Veel Rump Cap Roast", isFavourite: false, imagePath: "", price: "EGP 184.00")]
        weeklySection = ItemSection(name: "You Might Also Like", items: items)
        youMayLikeSection = ItemSection(name: "Customer Who Bought this Also Bought", items: items)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: IBAction Methods:-
    
    func cartButtonTapped() {
        
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
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductDetailTableViewCell.cellIdentifier, for: indexPath)
            if let productDetailCell = cell as? ProductDetailTableViewCell {
                productDetailCell.configure(productDetailObj: self.productDetailObj)
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ItemCollectionTableViewCell.cellIdentifier, for: indexPath)
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
