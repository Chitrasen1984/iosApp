//
//  ProductListViewController.swift
//  GourmetEgypt_Swift
//
//  Created by Ashutosh Mishra on 09/05/17.
//  Copyright © 2017 Ashutosh Mishra. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController {

    var detailItem:Any?
    let subCategoryManager: SubCategoryCollectionManager = SubCategoryCollectionManager()
    let itemCollectionManager: ItemCollectionManager = ItemCollectionManager()
    
    @IBOutlet weak var categoriesView: UIView!
    @IBOutlet weak var subCategoryCollectionView: UICollectionView!
    @IBOutlet weak var itemCollectionView: UICollectionView!
    
    //MARK: ViewController LifeCycle Methods:-
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.automaticallyAdjustsScrollViewInsets = false
        self.navigationItem.title = "Meat and Seafood(100+)"
        
        self.categoriesView.layer.shadowOffset = CGSize(width: 1, height: 2);
        self.categoriesView.layer.shadowColor = UIColor.darkGray.cgColor
        self.categoriesView.layer.shadowRadius = 5;
        self.categoriesView.layer.shadowOpacity = 0.25;
        self.categoriesView.clipsToBounds = false
        self.categoriesView.layer.masksToBounds = false
        
        self.edgesForExtendedLayout = [.top]
        configureItemCollectionView()
        configureSubCategoryCollectionView()
    }
    
    func configureItemCollectionView() {
        let nib = UINib(nibName: "ItemCollectionViewCell", bundle: Bundle.main)
        itemCollectionView.register(nib, forCellWithReuseIdentifier: "itemCell")
        let headerNib = UINib(nibName: "ItemCollectionHeaderReusableView", bundle: Bundle.main)
        itemCollectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "ItemCollectionHeader")
        
        itemCollectionView.dataSource = itemCollectionManager
        itemCollectionView.delegate = itemCollectionManager
        let items = [ProductListModel(id: "1", title: "South African Angus Veel Rump Cap Roast", isFavourite: false, imagePath: "", price: "EGP 184.00"),
            ProductListModel(id: "1", title: "South African Angus Veel Rump Cap Roast", isFavourite: false, imagePath: "", price: "EGP 184.00"),
            ProductListModel(id: "1", title: "South African Angus Veel Rump Cap Roast", isFavourite: false, imagePath: "", price: "EGP 184.00"),
            ProductListModel(id: "1", title: "South African Angus Veel Rump Cap Roast", isFavourite: false, imagePath: "", price: "EGP 184.00")]
        let popularSection = ItemSection(name: "Most Popular", items: items)
        let weeklySection = ItemSection(name: "Weekly", items: items)
        let monthlySection = ItemSection(name: "Monthly", items: items)
        
        itemCollectionManager.itemSections = [popularSection, weeklySection, monthlySection]
        itemCollectionManager.delegate = self
        itemCollectionView.reloadData()
    }
    
    func configureSubCategoryCollectionView() {
        let nib = UINib(nibName: SubCategoryCollectionViewCell.nibName, bundle: Bundle.main)
        subCategoryCollectionView.register(nib, forCellWithReuseIdentifier: SubCategoryCollectionViewCell.cellIdentifier)
        subCategoryCollectionView.dataSource = subCategoryManager
        subCategoryCollectionView.delegate = subCategoryManager
        subCategoryManager.categories = [CategoryModel(id: "1", title: "All", imagePath: "www.google.com", subCategories: []),CategoryModel(id: "2", title: "Beef", imagePath: "www.google.com", subCategories: []),
            CategoryModel(id: "3", title: "Beef & Veel", imagePath: "www.google.com", subCategories: []),
            CategoryModel(id: "4", title: "Poultry", imagePath: "www.google.com", subCategories: []),
            CategoryModel(id: "5", title: "Lamb", imagePath: "www.google.com", subCategories: []),
            CategoryModel(id: "6", title: "Frozen", imagePath: "www.google.com", subCategories: [])]
        //["All", "Beef", "Beef & Veel", "Poultry", "Lamb", "Frozen"]
        subCategoryCollectionView.reloadData()
        subCategoryCollectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .bottom)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "ProductDetailSegue":
            if let vc = segue.destination as? ProductDetailsViewController {
                vc.item = sender as? ProductListModel
            }
        default:
            super.prepare(for: segue, sender: nil)
        }
    }

}
extension ProductListViewController: ItemCollectionManagerProtocol {
    func manager(collectionManager: ItemCollectionManager, didSelectItem item: ProductListModel) {
////        performSegue(withIdentifier: "ProductDetailSegue", sender: item)
//        let viewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ProductDetailsViewController")
//        self.navigationController?.pushViewController(viewController, animated: true)
         self.navigationController?.pushViewController(ProductDetailViewController(nibName: "ProductDetailViewController", bundle: nil), animated: true );
    }
}
